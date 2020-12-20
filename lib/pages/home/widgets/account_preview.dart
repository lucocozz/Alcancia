import 'package:alcancia/models/account_model.dart';
import 'package:alcancia/themes/themes.dart';
import 'package:alcancia/pages/account/widgets/account_page.dart';
import 'package:alcancia/pages/home/widgets/profil_image.dart';
import 'package:flutter/material.dart';

class AccountPreview extends StatelessWidget {
  final Account account;

  AccountPreview({this.account});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () => Navigator.pushNamed(
        context,
        AccountPage.routeName,
        arguments: account,
      ),
      child: Container(
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: _header(account: account),
                ),
                SizedBox(height: 20),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _boxInfo(boxName: "BALANCE", value: account.balance),
                      _boxInfo(boxName: "SAVINGS", value: account.savings),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _boxInfo({int value, String boxName}) {
    return Container(
      height: 100,
      width: 130,
      padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: gWhiteAccent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            boxName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: gPrimaryColor,
            ),
          ),
          RichText(
            text: TextSpan(
              text: "$value",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: " €",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _header({Account account}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              account.user,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              account.account,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[200],
              ),
            ),
          ],
        ),
        ProfilImage(
          account: account,
          size: 50,
          radius: 20,
          iconSize: 28,
          iconColor: Colors.blueGrey[200],
          backgroundColor: gWhiteAccent,
        ),
      ],
    );
  }
}
