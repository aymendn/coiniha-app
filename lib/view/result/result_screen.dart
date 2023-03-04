import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:microhack/core/app_color.dart';
import 'package:microhack/view/shared/custom_button.dart';

class ResultScreen extends HookConsumerWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final pages = [
      ListView(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'YOU ARE A ',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'THINKER',
                        style: TextStyle(
                          color: AppColor.secondaryBright,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                    'you are always taking refuge in your own head ,You are a great planner and You can predict things before they happen .You have a great skill but You have to live in the moment sometimes.',
                  ),
                  const SizedBox(height: 16),
                  Image.asset('assets/images/thinker.png'),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              iconColor: AppColor.secondaryBright,
              textColor: AppColor.secondaryBright,
              tileColor: AppColor.secondaryBright.withOpacity(0.1),
              title: const Text('You think it’s accurate ?'),
              subtitle: const Text('Share result with your friends'),
              trailing: const Icon(Icons.share_outlined),
            ),
          ),
          Card(
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: const Text('Curious for more?'),
              subtitle: const Text('Take similar surveys'),
              trailing: const Icon(Icons.question_mark),
              onTap: () {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/success.png'),
          const SizedBox(height: 16),
          const Text(
            'Done!',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text('Your ecoins has been added.'),
          const SizedBox(height: 16),
          CustomButton(
            onPressed: Navigator.of(context).pop,
            color: AppColor.secondaryBright,
            child: const Text('Continue'),
          ),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Result')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: pages,
        ),
      ),
    );
  }
}
