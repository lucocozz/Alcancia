import 'package:alcancia/constants.dart';
import 'package:alcancia/services/authentication_service.dart';
import 'package:alcancia/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool hide;
  bool register;
  bool loading;

  @override
  void initState() {
    super.initState();
    hide = true;
    register = false;
    loading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget._scaffoldKey,
      backgroundColor: gPrimaryColor,
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 30, right: 30),
        child: Stack(
          children: [
            _createAccountButton(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _logo(),
                _fields(register: register),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _createAccountButton() {
    return Container(
      decoration: BoxDecoration(
        color: gSecondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        icon: Icon(
          register ? Icons.how_to_reg : Icons.person_add_alt_1,
          size: 24,
        ),
        splashRadius: 1,
        onPressed: () => setState(() => register = !register),
      ),
    );
  }

  Widget _fields({bool register}) {
    return Container(
      child: Column(
        children: [
          _logField(
            autofocus: true,
            textInputAction: TextInputAction.next,
            controller: widget.emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: "email",
            prefixIcon: Icons.alternate_email_outlined,
          ),
          SizedBox(height: 20),
          _logField(
            controller: widget.passwordController,
            obscureText: hide,
            autocorrect: false,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.visiblePassword,
            hintText: "password",
            prefixIcon: Icons.lock_outline,
            showPassword: true,
          ),
          SizedBox(height: 20),
          _authButton(),
        ],
      ),
    );
  }

  Widget _authButton() {
    String result;
    return FlatButton(
      height: 40,
      // minWidth: 220,
      color: gSecondaryColor,
      shape: StadiumBorder(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            register ? "register" : "login",
            style: TextStyle(
              color: Colors.white,
              fontFamily: gFontFamily,
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
        if (register) {
          result = await context.read<AuthenticationService>().signUp(
                email: widget.emailController.text.trim(),
                password: widget.passwordController.text.trim(),
              );
        } else {
          result = await context.read<AuthenticationService>().signIn(
                email: widget.emailController.text.trim(),
                password: widget.passwordController.text.trim(),
              );
        }
        if (result != null) {
          _infoSnackBar(context: context, message: result);
        } else {
          setState(() {
            loading = true;
          });
        }
      },
    );
  }

  void _infoSnackBar({BuildContext context, String message}) {
    widget._scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.info, color: gSecondaryColor),
            SizedBox(width: 10),
            Text(
              message,
              style: TextStyle(
                color: gSecondaryColor,
                fontWeight: FontWeight.bold,
                fontFamily: gFontFamily,
              ),
            ),
          ],
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget _logField({
    bool obscureText = false,
    bool autocorrect = true,
    bool autofocus = false,
    TextInputAction textInputAction,
    TextInputType keyboardType,
    String hintText,
    IconData prefixIcon,
    bool showPassword = false,
    TextEditingController controller,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              autocorrect: autocorrect,
              autofocus: autofocus,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: Icon(prefixIcon),
                border: InputBorder.none,
                hintStyle: TextStyle(fontFamily: gFontFamily),
                labelStyle: TextStyle(fontFamily: gFontFamily),
              ),
            ),
          ),
          if (showPassword)
            IconButton(
              icon: Icon(
                hide ? Icons.visibility : Icons.visibility_off,
                color: gSecondaryColor,
              ),
              splashRadius: 1,
              onPressed: () => setState(() => hide = !hide),
            ),
        ],
      ),
    );
  }

  Widget _logo() {
    return Container(
      child: Column(
        children: [
          SvgPicture.asset(
            gAlcanciaLogo,
            color: Colors.white,
            height: 100,
          ),
          SizedBox(height: 7),
          Text(
            "alcancia",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "FredokaOne",
              fontSize: 35,
            ),
          )
        ],
      ),
    );
  }
}
