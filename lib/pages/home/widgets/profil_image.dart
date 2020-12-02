import 'package:flutter/material.dart';

import 'package:alcancia/models/account_model.dart';
import 'package:alcancia/themes/themes.dart';

class ProfilImage extends StatelessWidget {
  final Account account;
  final double size;
  final double radius;

  ProfilImage({this.account, this.size, this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: (account.photo != null
          ? Image.asset(account.photo, fit: BoxFit.cover)
          : Icon(
              Icons.person,
              color: Colors.blueGrey[200],
              size: 28,
            )),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: gWhiteAccent,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
