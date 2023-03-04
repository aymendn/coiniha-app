import 'package:flutter/material.dart';

import '../../../models/user_data.dart';

class CardLeader extends StatelessWidget {
  const CardLeader({super.key, required this.index, required this.user});
  final int index;
  final UserData user;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xffA99F9F).withOpacity(0.25),
      ),
      child: Column(
        children: [
          Badge(
            backgroundColor: const Color(0xff7355FF),
            textColor: Colors.white,
            label: Text(index.toString()),
            textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            largeSize: 20,
            alignment: AlignmentDirectional.center,
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            user.displayName as String,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(user.score.toString(),
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              )),
        ],
      ),
    );
  }
}
