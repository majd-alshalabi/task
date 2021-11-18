import 'package:flutter/material.dart';
import 'package:task2/constant/constant.dart';
import 'package:task2/shared/sharedPreHelper.dart';
import 'package:task2/view/loginView.dart';

class AccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () async {
              await SharedPre.setUserID(-1);
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginView.id, (route) => false);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              width: size.width * 0.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300]),
              child: Row(
                children: [
                  Icon(
                    Icons.logout_outlined,
                    color: firstColor,
                  ),
                  Text(
                    'Log out',
                    style: TextStyle(color: firstColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
