import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/app_color.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
        bottom: 0,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.white.withOpacity(.25), width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const Image(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/image_35.png"),
            ),
          ),
          const SizedBox(height: 9),
          const Text(
            'COINIHA T-SHIRT',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const Text(
            '100 Coins',
            style: TextStyle(
              color: AppColor.secondary,
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 13),
          FilledButton(
              style: FilledButton.styleFrom(backgroundColor: AppColor.primary),
              onPressed: () {},
              child: const Text(
                "Purshase",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
              ))
        ],
      ),
    );
  }
}
