import 'package:flutter/material.dart';
import 'package:teste_tecnico_guia_de_moteis/core/extensions/app_theme_extension.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_base_card_widget.dart';

class CustomImageNameMotelCardWidget extends StatelessWidget {
  final String imageUrl;
  final String suiteName;

  const CustomImageNameMotelCardWidget({super.key, required this.imageUrl, required this.suiteName});

  @override
  Widget build(BuildContext context) {
    return CustomBaseCardWidget(
      radius: 8,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (_, __, ___) => const Center(child: Icon(Icons.broken_image)),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.black, Colors.transparent],
                      stops: suiteName.length > 30 ? [0.92, 1.0] : [1.0, 1.0],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstIn,
                  child: Text(
                    suiteName.toLowerCase(),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.clip,
                    style: context.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
