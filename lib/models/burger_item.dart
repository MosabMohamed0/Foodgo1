class BurgerItem {
  final String imagePath;
  final String title;
  final String subtitle;
  final double rating;
  bool isFavorite;
  final String description;
  final int minutes;
  final double price;

  BurgerItem({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.rating,
    this.isFavorite = false,
    required this.description,
    required this.minutes,
    required this.price,
  });
}
