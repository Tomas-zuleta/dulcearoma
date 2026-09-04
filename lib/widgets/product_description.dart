// product_description.dart
//
// Sección "Descripción": párrafo con el detalle del producto.

import 'package:flutter/material.dart';
import '../theme/app_text_styles.dart';

class ProductDescription extends StatelessWidget {
  final String text;

  const ProductDescription({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppTextStyles.description);
  }
}
