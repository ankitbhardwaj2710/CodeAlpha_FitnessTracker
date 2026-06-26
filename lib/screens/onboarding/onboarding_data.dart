class OnboardingData {
  final String title;
  final String description;
  final String icon;

  OnboardingData({
    required this.title,
    required this.description,
    required this.icon,
  });
}

final List<OnboardingData> onboardingPages = [
  OnboardingData(
    title: "Track Your Workout",
    description:
        "Monitor workouts, calories and daily fitness progress easily.",
    icon: "🏋️",
  ),
  OnboardingData(
    title: "Stay Hydrated",
    description:
        "Track your daily water intake and build healthy habits.",
    icon: "💧",
  ),
  OnboardingData(
    title: "Achieve Your Goals",
    description:
        "Stay consistent and become a healthier version of yourself.",
    icon: "🏆",
  ),
];