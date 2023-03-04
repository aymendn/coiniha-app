// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PageItem extends StatelessWidget {
  const PageItem({
    Key? key,
    required this.currentSteps,
    required this.imageurl,
  }) : super(key: key);

  final int currentSteps;
  final String imageurl;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(height: height * 0.1),
        Image.asset(
          imageurl,
          height: height * 0.4,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
          child: Column(
            children: [
              Stack(
                children: [
                  const Text(
                    'Receive gifts while having fun',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Positioned(
                    bottom: -20,
                    right: -25,
                    child: Image.asset(
                      'assets/images/arrow.png',
                      height: height * 0.064,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
                'We were always exposed to the same parts oof our country as a community, we forget that there is truly more to Algeria than beaches.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
