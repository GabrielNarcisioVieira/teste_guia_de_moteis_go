import 'package:flutter/material.dart';

class CustomSwitchButtonWidget extends StatefulWidget {
  const CustomSwitchButtonWidget({super.key});

  @override
  State<CustomSwitchButtonWidget> createState() => _CustomSwitchButtonWidgetState();
}

class _CustomSwitchButtonWidgetState extends State<CustomSwitchButtonWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant, // Fundo sutil do tema
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          // 1. O "Slider" (a parte branca que se move)
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            alignment: selectedIndex == 0
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Container(
              width: 150, // Metade do container pai
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),

          // 2. Os Textos e a Lógica de Clique
          Row(
            children: [
              _buildOption("Opção 1", 0),
              _buildOption("Opção 2", 1),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOption(String label, int index) {
    final isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedIndex = index),
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 250),
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
            child: Text(label),
          ),
        ),
      ),
    );
  }
}
