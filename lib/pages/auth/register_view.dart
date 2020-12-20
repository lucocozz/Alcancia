import 'package:flutter/material.dart';

import 'widgets/auth_button.dart';
import 'widgets/log_field.dart';

class RegisterView extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  RegisterView({this.scaffoldKey});

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final comfirmPasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  void dispose() {
    comfirmPasswordController.dispose();
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: LogField(
                  textInputAction: TextInputAction.next,
                  controller: firstNameController,
                  keyboardType: TextInputType.name,
                  hintText: "first name",
                  prefixIcon: Icons.person_outline,
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                child: LogField(
                  textInputAction: TextInputAction.next,
                  controller: lastNameController,
                  keyboardType: TextInputType.name,
                  hintText: "last name",
                  prefixIcon: Icons.person_outline,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
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
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.visiblePassword,
            hintText: "password",
            prefixIcon: Icons.lock_outline,
            showPassword: true,
          ),
          SizedBox(height: 20),
          LogField(
            controller: comfirmPasswordController,
            autocorrect: false,
            obscureText: true,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.visiblePassword,
            hintText: "confirm password",
            prefixIcon: Icons.lock_outline,
            showPassword: true,
          ),
          SizedBox(height: 20),
          AuthButton(
            text: "register",
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
            confirmPassword: comfirmPasswordController.text.trim(),
            firstName: firstNameController.text.trim(),
            lastName: lastNameController.text.trim(),
            scaffoldKey: widget.scaffoldKey,
          ),
        ],
      ),
    );
  }
}
