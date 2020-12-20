import 'package:alcancia/models/account_model.dart';
import 'package:alcancia/pages/home/widgets/profil_image.dart';
import 'package:alcancia/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:alcancia/themes/themes.dart';
import '../../data/account_list.dart' as data;
import '../../data/menu_list.dart' as list;

class DrawerView extends StatelessWidget {
  final Account account = data.accountList[0];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: gPrimaryColor,
      padding: EdgeInsets.only(left: 30, right: 30, top: 150, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _header(account: account),
          _menuList(),
          _logout(context: context),
        ],
      ),
    );
  }

  Widget _logout({BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RaisedButton(
          elevation: 5,
          padding: EdgeInsets.symmetric(vertical: 13, horizontal: 30),
          color: Colors.white,
          onPressed: () => context.read<AuthenticationService>().signOut(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          child: Row(
            children: [
              Text(
                "Log out",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 20),
              Icon(
                Icons.logout,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _menuList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...list.menu.map(
          (element) => _menuTile(
            icon: element.icon,
            title: element.title,
            function: element.function,
          ),
        ),
      ],
    );
  }

  Widget _menuTile({IconData icon, String title, Function function}) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Icon(
        icon,
        color: Colors.white,
        size: 28,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 23,
        ),
      ),
      onTap: () => print(title),
    );
  }

  Widget _header({Account account}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Hello,\n${account.firstname}",
          style: TextStyle(
            height: 1.2,
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        ProfilImage(account: account, size: 70, radius: 27),
      ],
    );
  }
}
