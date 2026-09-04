// toppings_list.dart
//
// Sección "Extra Toppings": lista de checkboxes circulares con
// nombre y precio adicional de cada topping.

import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../models/topping_model.dart';

class ToppingsList extends StatelessWidget {
  final List<ToppingModel> toppings;
  final void Function(int index, bool value) onChanged;

  const ToppingsList({
    super.key,
    required this.toppings,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Extra Toppings', style: AppTextStyles.sectionLabel),
        const SizedBox(height: 8),
        ...List.generate(toppings.length, (index) {
          final topping = toppings[index];
          return _ToppingTile(
            topping: topping,
            onChanged: (value) => onChanged(index, value ?? false),
          );
        }),
      ],
    );
  }
}

class _ToppingTile extends StatelessWidget {
  final ToppingModel topping;
  final ValueChanged<bool?> onChanged;

  const _ToppingTile({required this.topping, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!topping.selected),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            _CircleCheckbox(value: topping.selected, onChanged: onChanged),
            const SizedBox(width: 14),
            Expanded(
              child: Text(topping.name, style: AppTextStyles.toppingName),
            ),
            Text(
              '+\$${topping.price.toStringAsFixed(2)}',
              style: AppTextStyles.toppingPrice,
            ),
          ],
        ),
      ),
    );
  }
}

class _CircleCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const _CircleCheckbox({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: value ? AppColors.primary : Colors.transparent,
        border: Border.all(
          color: value ? AppColors.primary : AppColors.border,
          width: 1.8,
        ),
      ),
      child: value
          ? const Icon(Icons.check, size: 14, color: Colors.white)
          : null,
    );
  }
}
