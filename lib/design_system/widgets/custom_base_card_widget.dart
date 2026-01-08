import 'package:flutter/material.dart';
import 'package:teste_tecnico_guia_de_moteis/core/extensions/app_theme_extension.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/theme/app_colors.dart';

class CustomBaseCardWidget extends StatelessWidget {
  final Color? color;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? radius;

  const CustomBaseCardWidget({
    super.key,
    required this.child,
    this.padding,
    this.width,
    this.color,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? context.surfaceColor,
        borderRadius: BorderRadius.circular(radius ?? 12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}
