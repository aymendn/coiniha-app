import 'package:flutter/material.dart';

class RankWidget extends StatelessWidget {
  RankWidget({required this.index, super.key});
  int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          color: const Color(0xffA99F9F).withOpacity(0.25),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Text("#$index",
                  style: const TextStyle(
                    color: Color(0xffFF6584),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
              const SizedBox(width: 10),
              const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
              ),
              const SizedBox(width: 10),
              const Text("Fares Bekkouche",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    height: 2,
                  )),
              const Spacer(),
              const Text("1032 Coins",
                  style: TextStyle(
                    color: Color(0xffFF6584),
                    fontWeight: FontWeight.bold,
                    fontSize: 14.6,
                  )),
              const SizedBox(width: 2),
            ],
          ),
        ),
      ),
    );
  }
}
