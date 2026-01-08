import 'package:flutter/material.dart';
import 'package:teste_tecnico_guia_de_moteis/core/extensions/app_theme_extension.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_switch_button/custom_switch_option_widget.dart';

class CustomSwitchButtonWidget extends StatefulWidget {
  const CustomSwitchButtonWidget({super.key});

  @override
  State<CustomSwitchButtonWidget> createState() => _CustomSwitchButtonWidgetState();
}

class _CustomSwitchButtonWidgetState extends State<CustomSwitchButtonWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 37,
      decoration: BoxDecoration(
        color: context.primaryContainer,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            alignment: selectedIndex == 0 ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              width: 130,
              height: 50,
              decoration: BoxDecoration(
                color: context.surfaceColor,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4, offset: const Offset(0, 2))],
              ),
            ),
          ),
          Row(
            children: [
              CustomSwitchOptionWidget(
                label: 'ir agora',
                icon: Icons.flash_on,
                index: 0,
                selectedIndex: selectedIndex,
                onTap: () {
                  setState(() => selectedIndex = 0);
                },
              ),
              CustomSwitchOptionWidget(
                label: 'ir outro dia',
                icon: Icons.edit_calendar_outlined,
                index: 1,
                selectedIndex: selectedIndex,
                onTap: () {
                  setState(() => selectedIndex = 1);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
