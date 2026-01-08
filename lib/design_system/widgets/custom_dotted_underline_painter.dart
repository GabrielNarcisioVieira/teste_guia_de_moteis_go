import 'package:flutter/material.dart';

class DottedUnderlinePainter extends CustomPainter {
  final Color color;
  final double dotWidth;
  final double dotHeight;
  final double spacing;

  DottedUnderlinePainter({
    required this.color,
    this.dotWidth = 4.0,
    this.dotHeight = 2.0,
    this.spacing = 3.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    double startX = 0;

    while (startX < size.width) {
      canvas.drawRect(
        Rect.fromLTWH(
          startX,
          size.height - dotHeight,
          dotWidth,
          dotHeight,
        ),
        paint,
      );

      startX += dotWidth + spacing;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}