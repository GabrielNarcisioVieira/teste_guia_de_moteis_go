import 'package:flutter/material.dart';
import 'package:teste_tecnico_guia_de_moteis/core/extensions/app_theme_extension.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_dotted_underline_painter.dart';

class CustomOutlineDropdownWidget extends StatelessWidget {
  final String selectedValue;
  final Color? textColor;
  final Color? iconColor;
  final Color? underlineColor;
  final bool showUnderline;
  final double? fontSize;

  const CustomOutlineDropdownWidget({
    super.key,
    required this.selectedValue,
    this.textColor,
    this.iconColor,
    this.underlineColor,
    this.showUnderline = true, this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final finalTextColor = textColor ?? context.surfaceColor;
    final finalIconColor = iconColor ?? context.surfaceColor;
    final finalUnderlineColor = underlineColor ?? context.tertiaryColor;

    final content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          selectedValue,
          style: context.bodyMedium!.copyWith(
            color: finalTextColor,
            fontWeight: FontWeight.bold,
            fontSize: fontSize ?? 13,
          ),
        ),
        const SizedBox(width: 4),
        Icon(
          Icons.keyboard_arrow_down,
          color: finalIconColor,
        ),
      ],
    );

    if (showUnderline) {
      return CustomPaint(
        painter: DottedUnderlinePainter(
          color: finalUnderlineColor,
          dotWidth: 2.0,
          dotHeight: 1.0,
          spacing: 1.5,
        ),
        child: content,
      );
    }

    return content;
  }
}