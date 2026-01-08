import 'package:flutter/material.dart';
import 'package:teste_tecnico_guia_de_moteis/core/extensions/app_theme_extension.dart';

class CustomFilterChipItemWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final IconData? icon;

  const CustomFilterChipItemWidget({super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? context.primaryColor : context.surfaceColor,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isSelected
                ? context.primaryColor
                : context.surfaceContainerHighest,
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            icon != null ? Padding(
              padding: const EdgeInsets.only(right: 2),
              child: Icon(icon!, size: 16,),
            ) : SizedBox(),
            Text(
              label,
              style: context.bodyMedium?.copyWith(
                fontSize: 11,
                color: isSelected ? context.onPrimary : context.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}