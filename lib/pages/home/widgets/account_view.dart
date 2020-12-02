import 'package:flutter/material.dart';

import 'account_preview.dart';
import '../../../data/account_list.dart' as data;

class AccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, top: 50),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _alcanciaTitle(),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: data.accountList.length,
                separatorBuilder: (context, index) => SizedBox(height: 20),
                itemBuilder: (context, index) {
                  return AccountPreview(account: data.accountList[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _alcanciaTitle() {
    return Text(
      "alcancia",
      style: TextStyle(
        color: Colors.white,
        fontSize: 30,
        letterSpacing: 3,
        fontFamily: "FredokaOne",
      ),
    );
  }
}
