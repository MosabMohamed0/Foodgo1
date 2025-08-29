import 'package:flutter/material.dart';
import 'package:foodgo/features/homeView/burger%20details.dart';

class BurgerItemCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final double rating;
  bool isFavorite;
  final String description;
  final int minutes;
  final double price;
  final VoidCallback onFavoriteToggle;

  BurgerItemCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.description,
    required this.minutes,
    required this.price,
    required this.isFavorite,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  State<BurgerItemCard> createState() => _BurgerItemCardState();
}

class _BurgerItemCardState extends State<BurgerItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 6,
      shadowColor: Color(0xFFFF939B),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return BurgerDetails(
                  imagePath: widget.imagePath,
                  title: widget.title,
                  subtitle: widget.subtitle,
                  rating: widget.rating,
                  description: widget.description,
                  minutes: widget.minutes,
                  price: widget.price,
                  isFavorite: widget.isFavorite,
                );
              },
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Burger Image
              Center(
                child: Image.asset(
                  widget.imagePath,
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 12),
              // Title
              Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              // Subtitle
              Text(
                widget.subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 8),
              // Rating Row
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    widget.rating.toString(),
                    style: const TextStyle(fontSize: 14),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: widget.onFavoriteToggle,
                    icon: Icon(
                      widget.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
