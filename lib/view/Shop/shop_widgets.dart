import 'package:flutter/material.dart';
import 'package:microhack/models/product.dart';

import '../../core/app_color.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({
    super.key, required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.white.withOpacity(.25), width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:  Image(
              fit: BoxFit.cover,
              image: AssetImage(product.imageUrl),
            ),
          ),
          const SizedBox(height: 9),
         Text(
            '${product.title}',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            
            ),
          ),
           Text(
            '${product.price} Coins',
            style: const TextStyle(
              color: AppColor.secondary,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 6),
          FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AppColor.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                minimumSize: const Size(140, 40),
              ),
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
