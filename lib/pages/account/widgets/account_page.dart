import 'package:alcancia/constants.dart';
import 'package:alcancia/models/account_model.dart';
import 'package:alcancia/themes/themes.dart';
import 'package:alcancia/pages/home/widgets/profil_image.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  static const String routeName = "/account_page";

  @override
  Widget build(BuildContext context) {
    final Account account = ModalRoute.of(context).settings.arguments;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0XFFF0F1F5),
      body: Stack(
        children: [
          _header(account: account, size: size),
          _backButton(context: context),
          _transactionSheet(account: account),
          _transactionButton(),
        ],
      ),
    );
  }

  Widget _transactionButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(33),
          onTap: () => print("transaction button"),
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: gPrimaryColor,
              borderRadius: BorderRadius.circular(33),
              boxShadow: [
                BoxShadow(
                    color: gPrimaryColor, blurRadius: 10, spreadRadius: -2)
              ],
            ),
            child: Icon(Icons.swap_horiz, size: 35),
          ),
        ),
      ),
    );
  }

  Widget _transactionSheet({Account account}) {
    return SafeArea(
      child: DraggableScrollableSheet(
        initialChildSize: 0.50,
        minChildSize: 0.50,
        builder: (context, scrollController) {
          return Material(
            elevation: 50,
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(60)),
            child: Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 10),
              child: Column(
                children: [
                  Container(
                    height: 7,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Transactions",
                      style: TextStyle(fontFamily: gFontFamily, fontSize: 25),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      physics: BouncingScrollPhysics(),
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: _transactionsTile(account: account),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _transactionsTile({Account account}) {
    return ListTile(
      leading: ProfilImage(account: account, size: 50, radius: 20),
      title: Text(account.firstname),
      subtitle: Text(account.lastname),
      trailing: Container(
        child: Text("${account.balance}"),
      ),
    );
  }

  Widget _backButton({BuildContext context}) {
    return Positioned(
      left: 30,
      top: 50,
      child: Container(
        decoration: BoxDecoration(
          color: gPrimaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: IconButton(
          splashRadius: 1,
          icon: Icon(
            Icons.close,
            size: 28,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }

  Widget _header({Account account, Size size}) {
    return Container(
      height: size.height * 0.4,
      margin: EdgeInsets.only(left: 30, right: 30, top: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfilImage(size: 100, account: account, radius: 40),
          Text(
            "${account.firstname} ${account.lastname}",
            style: TextStyle(
              fontSize: 35,
              fontFamily: gFontFamily,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _boxInfo(boxName: "BALANCE", value: account.balance),
              _boxInfo(boxName: "SAVINGS", value: account.savings),
            ],
          ),
        ],
      ),
    );
  }

  Widget _boxInfo({int value, String boxName}) {
    return Container(
      height: 110,
      width: 160,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Color(0XFFE6E9EE),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            boxName,
            style: TextStyle(
              fontFamily: gFontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0XFFAAABBF),
            ),
          ),
          SizedBox(height: 10),
          RichText(
            text: TextSpan(
              text: "$value",
              style: TextStyle(
                fontFamily: gFontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: " €",
                  style: TextStyle(
                    fontFamily: gFontFamily,
                    fontSize: 19,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
