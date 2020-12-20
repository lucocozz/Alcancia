import 'package:alcancia/themes/themes.dart';
import 'package:flutter/material.dart';

class LogField extends StatefulWidget {
  final bool autocorrect;
  final bool obscureText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String hintText;
  final IconData prefixIcon;
  final bool showPassword;
  final TextEditingController controller;

  LogField({
    this.autocorrect = true,
    this.obscureText = false,
    this.textInputAction,
    this.keyboardType,
    this.hintText,
    this.prefixIcon,
    this.showPassword = false,
    this.controller,
  });

  @override
  _LogFieldState createState() => _LogFieldState();
}

class _LogFieldState extends State<LogField> {
  bool hide;

  @override
  void initState() {
    super.initState();
    hide = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              obscureText: (widget.obscureText ? hide : false),
              autocorrect: widget.autocorrect,
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction,
              decoration: InputDecoration(
                hintText: widget.hintText,
                prefixIcon: Icon(widget.prefixIcon),
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value.isEmpty)
                  return "Is required";
                else
                  return null;
              },
            ),
          ),
          if (widget.showPassword)
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
}
