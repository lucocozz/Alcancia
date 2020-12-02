import 'package:alcancia/models/account_model.dart';

List<Account> accountList = <Account>[
  Account(
    user: "My Alcancia",
    account: "MAIN ACCOUNT",
    firstname: "Luigi",
    lastname: "Cocozza",
    photo: "assets/images/luigi_cocozza.jpg",
    balance: 734,
    savings: 420,
  ),
  Account(
    account: "SUB ACCOUNT",
    user: "Inv. locatif",
    photo: null,
    balance: 2000,
    savings: 0,
  ),
  Account(
    account: "SUB ACCOUNT",
    user: "Goal",
    photo: null,
    balance: 512,
    savings: 256,
  ),
];
