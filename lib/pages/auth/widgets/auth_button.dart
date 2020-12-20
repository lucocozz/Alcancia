import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../themes/themes.dart';
import '../../../services/authentication_service.dart';

class AuthButton extends StatefulWidget {
  final String text;
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String confirmPassword;
  final GlobalKey<ScaffoldState> scaffoldKey;

  AuthButton({
    this.text,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.confirmPassword,
    this.scaffoldKey,
  });

  @override
  _AuthButtonState createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  bool loading;

  @override
  void initState() {
    super.initState();
    loading = false;
  }

  @override
  Widget build(BuildContext context) {
    String result;
    return FlatButton(
      height: 40,
      color: gSecondaryColor,
      shape: StadiumBorder(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          if (loading) SizedBox(width: 10),
          if (loading)
            SizedBox(
              width: 10,
              height: 10,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
        ],
      ),
      onPressed: () async {
        setState(() {
          loading = true;
        });
        if (widget.text == "login")
          result = await context.read<AuthenticationService>().signIn(
                email: widget.email,
                password: widget.password,
              );
        else if (widget.text == "register") {
          print("password: ${widget.password}");
          print("confirm password: ${widget.confirmPassword}");
          if (widget.password.compareTo(widget.confirmPassword) == 0) {
            print("identical");
            result = await context.read<AuthenticationService>().signUp(
                  email: widget.email,
                  password: widget.password,
                  firstName: widget.firstName,
                  lastName: widget.lastName,
                );
          } else {
            print("not Identical");
            _snackBar(
              message: "Password are not identical",
              color: Colors.red,
              icon: Icons.error_outline,
            );
            setState(() {
              loading = false;
            });
          }
        }

        if (result != null) {
          _snackBar(
            message: result,
            color: gSecondaryColor,
            icon: Icons.info_outline,
          );
          setState(() {
            loading = false;
          });
        }
      },
    );
  }

  void _snackBar({String message, Color color, IconData icon}) {
    widget.scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: color),
            SizedBox(width: 10),
            Text(
              message,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.white,
      ),
    );
  }
}
