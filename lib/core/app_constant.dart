import '../models/onboarding_item.dart';

class AppConstant {
  const AppConstant._();

  static const String homeIcon = 'assets/images/home.svg';
  static const String storeIcon = 'assets/images/store.svg';
  static const String rankIcon = 'assets/images/rank.svg';
  static const String profileIcon = 'assets/images/profile.svg';
  static const String logo = 'assets/images/logo.svg';

  static List<OnboardingItem> onboardingItems = [
    const OnboardingItem(
      title: 'Receive gifts while having fun',
      description:
          'We were always exposed to the same parts oof our country as a community, we forget that there is truly more to Algeria than beaches.',
      image: 'assets/images/onboarding_1.png',
    ),
    const OnboardingItem(
      title: 'Receive gifts while having fun 2',
      description:
          'We were always exposed to the same parts oof our country as a community, we forget that there is truly more to Algeria than beaches.',
      image: 'assets/images/onboarding_2.png',
    ),
    const OnboardingItem(
      title: 'Receive gifts while having fun 3',
      description:
          'We were always exposed to the same parts oof our country as a community, we forget that there is truly more to Algeria than beaches.',
      image: 'assets/images/onboarding_3.png',
      buttonText: 'Get Started',
    ),
  ];
}
