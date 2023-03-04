import 'package:flutter/material.dart';

import '../../core/app_color.dart';
import '../shared/custom_button.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({
    super.key,
  });

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
        crossAxisAlignment: CrossAxisAlignment.start,
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
            'COINIHA T-SHIRT  ',
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
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 6),
          Center(
            child: CustomButton(
              height: 42,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    // return a dialog saying that the purchase was successful
                    return AlertDialog(
                      title: const Text(
                        'Purchase Successful!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: const Text(
                          'You have successfully purchased the item'),
                      actions: [
                        CustomButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          height: 50,
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Purchase'),
            ),
          ),
        ],
      ),
    );
  }
}
