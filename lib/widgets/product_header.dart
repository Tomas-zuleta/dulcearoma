// product_header.dart
//
// Sección "Header": título del producto, tag (ej. "Premium Bakery"),
// precio y botón de favorito. Es un widget "tonto" (stateless) que
// recibe todo por parámetro y avisa hacia arriba con callbacks.

import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class ProductHeader extends StatelessWidget {
  final String title;
  final String tag;
  final double price;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const ProductHeader({
    super.key,
    required this.title,
    required this.tag,
    required this.price,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.title),
                  const SizedBox(height: 6),
                  Text(tag.toUpperCase(), style: AppTextStyles.tag),
                ],
              ),
            ),
            const SizedBox(width: 12),
            _FavoriteButton(
              isFavorite: isFavorite,
              onTap: onFavoriteTap,
            ),
          ],
        ),
        const SizedBox(height: 14),
        Text('\$${price.toStringAsFixed(2)}', style: AppTextStyles.price),
      ],
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onTap;

  const _FavoriteButton({required this.isFavorite, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: AppColors.primaryLight,
          shape: BoxShape.circle,
        ),
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: AppColors.primary,
          size: 20,
        ),
      ),
    );
  }
}
