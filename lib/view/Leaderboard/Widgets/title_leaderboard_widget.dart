import 'package:flutter/material.dart';
import 'package:microhack/core/app_color.dart';

class TitleLeaderBoardWidget extends StatelessWidget {
  const TitleLeaderBoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 15),
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(19),
      ),
      child: Row(children: const [
        Text("Rank",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            )),
        SizedBox(width: 20),
        Text("User",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            )),
        Spacer(),
        Text("Coins",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            )),
        SizedBox(width: 20)
      ]),
    );
  }
}
