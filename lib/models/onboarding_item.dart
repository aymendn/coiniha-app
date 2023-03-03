
class OnboardingItem {
  final String title;
  final String description;
  final String image;
  final String buttonText;

  const OnboardingItem({
    required this.title,
    required this.description,
    required this.image,
    this.buttonText = 'Next',
  });

  
}