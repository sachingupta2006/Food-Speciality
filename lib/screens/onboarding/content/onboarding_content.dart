class OnbordingContent {
  String image;
  String title;
  String discription;

  OnbordingContent({required this.image, required this.title, required this.discription});
}

List<OnbordingContent> contents = [
  OnbordingContent(
    title: 'Share Your Recipes',
    image: 'assets/onboarding1.png',
    discription: "Share your unique recipes with friends, family, chefs, and other aspiring cooks!"
  ),
  OnbordingContent(
    title: 'Discover Recipes',
    image: 'assets/onboarding2.png',
    discription: "Search and discover local South African recipes and recipes from all over the world."
  ),
  OnbordingContent(
    title: 'Create A Community',
    image: 'assets/onboarding3.png',
    discription: "Create a community and connect with friends, family, chefs and other aspiring cooks."
  ),
];