import 'package:flutter/material.dart';

class CardLeader extends StatelessWidget {
  const CardLeader({super.key, required this.index});
  final  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      padding: const EdgeInsets.symmetric(horizontal: 12.4, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
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
              radius: 30,
              backgroundColor: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Oussama',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          const Text('1032 Coins',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              )),
        ],
      ),
    );
  }
}
