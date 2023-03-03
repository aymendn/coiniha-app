
import 'package:flutter/material.dart';

class CustomArrowButton extends StatelessWidget {
  const CustomArrowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff20232D),
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
