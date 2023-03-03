import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:microhack/view/auth/steps.dart';
import 'package:microhack/view/shared/custom_button.dart';

import '../../providers/onboarding.dart';
import 'page_item.dart';

class OnboardingScreen extends HookConsumerWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<int> currentStep = useState(0);
    final PageController pageController = usePageController();

    void onStepChanged() {
      if (currentStep.value < 2) {
        pageController.animateToPage(
          currentStep.value + 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        ref.read(onboardingProvider.notifier).setOnboarding(false);
      }
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) => currentStep.value = index,
              children: const [
                PageItem(currentSteps: 0),
                PageItem(currentSteps: 1),
                PageItem(currentSteps: 2),
              ],
            ),
          ),
          Steps(
            currentSteps: currentStep.value,
            stepsCount: 3,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: CustomButton(
              onPressed: onStepChanged,
              child: Text(
                currentStep.value < 2 ? 'Next' : 'Get Started',
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
