import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';
import '../../themes/themes.dart';
import '../../pages/auth/login_view.dart';
import '../../pages/auth/register_view.dart';

class AuthPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool register;

  @override
  void initState() {
    super.initState();
    register = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget._scaffoldKey,
      backgroundColor: gPrimaryColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            height: MediaQuery.of(context).size.height,
          ),
          child: Container(
            margin: EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 50),
            child: Stack(
              children: [
                _accountButton(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _logo(),
                    (register
                        ? RegisterView()
                        : LoginView(scaffoldKey: widget._scaffoldKey)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _accountButton() {
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
