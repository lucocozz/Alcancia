import 'package:flutter/material.dart';

import 'package:alcancia/themes/themes.dart';
import 'package:alcancia/pages/home/account_view.dart';
import 'package:alcancia/pages/home/widgets/drawer_button.dart';
import 'package:alcancia/pages/home/drawer_view.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isOpen;

  @override
  void initState() {
    super.initState();
    isOpen = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gBackgroundColor,
      body: Stack(
        children: [
          AccountView(),
          if (isOpen) DrawerView(),
          DrawerButton(
            isOpen: isOpen,
            openDrawer: openDrawer,
            closeDrawer: closeDrawer,
          ),
        ],
      ),
    );
  }

  void openDrawer() {
    setState(() {
      isOpen = true;
    });
  }

  void closeDrawer() {
    setState(() {
      isOpen = false;
    });
  }
}
