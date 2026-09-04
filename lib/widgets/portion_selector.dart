// portion_selector.dart
//
// Sección "Select Portions": chips seleccionables (ej. "4-6 Portions",
// "8-10 Portions").

import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class PortionSelector extends StatelessWidget {
  final List<String> portions;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const PortionSelector({
    super.key,
    required this.portions,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Portions', style: AppTextStyles.sectionLabel),
        const SizedBox(height: 14),
        Row(
          children: List.generate(portions.length, (index) {
            final isSelected = selectedIndex == index;
            return Padding(
              padding: EdgeInsets.only(
                right: index != portions.length - 1 ? 12 : 0,
              ),
              child: _PortionChip(
                label: portions[index],
                isSelected: isSelected,
                onTap: () => onSelected(index),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _PortionChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _PortionChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryLight : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: isSelected
              ? AppTextStyles.chipSelected
              : AppTextStyles.chipUnselected,
        ),
      ),
    );
  }
}
