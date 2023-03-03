import 'package:flutter/material.dart';

class PageItem extends StatelessWidget {
  const PageItem({super.key, required this.currentSteps});

  final int currentSteps;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(color: Colors.red, height: height * 0.5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
          child: Column(
            children: const [
              Text(
                'Receive gifts while having fun',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              Text(
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
