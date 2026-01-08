import 'package:flutter/material.dart';
import 'package:teste_tecnico_guia_de_moteis/core/extensions/app_theme_extension.dart';

class CustomSwitchOptionWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final int index;
  final int selectedIndex;
  final Function onTap;

  const CustomSwitchOptionWidget({
    super.key,
    required this.label,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 250),
            style: context.headlineSmall!.copyWith(
              color: isSelected ? context.onSurfaceVariant : context.onPrimary,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 20, color: isSelected ? context.primaryColor : context.onPrimary),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    label,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
