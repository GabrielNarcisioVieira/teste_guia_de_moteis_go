import 'package:flutter/material.dart';
import 'package:teste_tecnico_guia_de_moteis/core/extensions/app_theme_extension.dart';

class CustomFloatingButtonWidget extends StatelessWidget {
  final VoidCallback onTap;

  const CustomFloatingButtonWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onTap,
      backgroundColor: context.surfaceColor,
      foregroundColor: context.primaryColor,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      icon: const Icon(Icons.map_outlined, size: 20),
      label: Text(
        'mapa',
        style: context.titleMedium?.copyWith(
          color: context.primaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}
