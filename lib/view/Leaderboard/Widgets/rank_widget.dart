import 'package:flutter/material.dart';
import 'package:microhack/models/user_data.dart';

class RankWidget extends StatelessWidget {
  const RankWidget({required this.index, super.key, required this.user});
  final int index;
  final UserData user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          color: const Color(0xffA99F9F).withOpacity(0.25),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04, vertical: size.height * 0.01),
          child: Row(
            children: [
              Text("#$index",
                  style: const TextStyle(
                    color: Color(0xffFF6584),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
              SizedBox(width: size.width * 0.06),
              const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
              ),
              SizedBox(width: size.width * 0.02),
              Text(user.displayName as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    height: 2,
                  )),
              const Spacer(),
              Text(user.score.toString(),
                  style: const TextStyle(
                    color: Color(0xffFF6584),
                    fontWeight: FontWeight.bold,
                    fontSize: 14.6,
                  )),
              SizedBox(width: size.width * 0.005),
            ],
          ),
        ),
      ),
    );
  }
}
