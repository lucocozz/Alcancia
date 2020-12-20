import 'package:flutter/material.dart';

import 'package:alcancia/models/account_model.dart';

class ProfilImage extends StatelessWidget {
  final Account account;
  final double size;
  final double radius;
  final Color backgroundColor;
  final Color iconColor;
  final double iconSize;

  ProfilImage({
    this.account,
    this.size,
    this.radius,
    this.backgroundColor,
    this.iconSize,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: (account.photo != null
          ? Image.asset(account.photo, fit: BoxFit.cover)
          : Icon(
              Icons.person,
              color: iconColor,
              size: iconSize,
            )),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
