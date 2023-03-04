import 'package:flutter/material.dart';
import 'package:microhack/core/app_color.dart';
import 'package:microhack/view/Leaderboard/Widgets/custom_arrow.dart';
import 'package:microhack/view/shared/custom_button.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(width: 10),
              const CustomArrowButton(),
            ],
          ),
          leadingWidth: 100,
          title: const Text(
            'Shop',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
          centerTitle: true,
          actions: const [
            Text(
              '343 Coins    ',
              style: TextStyle(
                color: AppColor.secondary,
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Get Your Rewards',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 23,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 20,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.6,
                    ),
                    itemBuilder: (ctx, index) {
                      return const ShopCard();
                    }),
              ),
            ],
          ),
        ));
  }
}

class ShopCard extends StatelessWidget {
  const ShopCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
