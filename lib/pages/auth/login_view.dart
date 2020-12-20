import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/auth_button.dart';
import 'widgets/log_field.dart';

class LoginView extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  LoginView({this.scaffoldKey});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          LogField(
            textInputAction: TextInputAction.next,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: "email",
            prefixIcon: Icons.alternate_email_outlined,
          ),
          SizedBox(height: 20),
          LogField(
            controller: passwordController,
            autocorrect: false,
            obscureText: true,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.visiblePassword,
            hintText: "password",
            prefixIcon: Icons.lock_outline,
            showPassword: true,
          ),
          SizedBox(height: 20),
          AuthButton(
            text: "login",
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
            scaffoldKey: widget.scaffoldKey,
          ),
        ],
      ),
    );
  }
}
