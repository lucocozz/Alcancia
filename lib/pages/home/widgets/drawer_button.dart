import 'package:alcancia/themes/themes.dart';
import 'package:flutter/material.dart';

import '../../../alcancia_icons.dart';

class DrawerButton extends StatefulWidget {
  final bool isOpen;
  final Function openDrawer;
  final Function closeDrawer;

  DrawerButton({this.isOpen, this.closeDrawer, this.openDrawer});

  @override
  _DrawerButtonState createState() => _DrawerButtonState();
}

class _DrawerButtonState extends State<DrawerButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 30,
      top: 50,
      child: Container(
        decoration: BoxDecoration(
          color: gSecondaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: IconButton(
          splashRadius: 1,
          icon: Icon(
            !widget.isOpen ? Alcancia.dot_menu : Icons.close,
            size: 28,
          ),
          onPressed: () =>
              widget.isOpen ? widget.closeDrawer() : widget.openDrawer(),
        ),
      ),
    );
  }
}
