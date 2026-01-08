import 'package:flutter/material.dart';
import 'package:teste_tecnico_guia_de_moteis/core/extensions/app_theme_extension.dart';

class CustomCarouselWidget<T> extends StatefulWidget {
  final List<T> items;
  final Widget Function(BuildContext context, int index, T item) itemBuilder;
  final double? height;
  final double? width;
  final bool showDots;
  final double viewportFraction;
  final Color? backgroundColor;

  const CustomCarouselWidget({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.height,
    this.width,
    this.showDots = true,
    this.viewportFraction = 1.0,
    this.backgroundColor,
  });

  @override
  State<CustomCarouselWidget<T>> createState() => _CustomCarouselWidgetState<T>();
}

class _CustomCarouselWidgetState<T> extends State<CustomCarouselWidget<T>> {
  late PageController _pageController;
  int _currentIndex = 0;
  double _calculatedHeight = 0;
  final GlobalKey _measuringKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: widget.viewportFraction);

    if (widget.height == null && widget.items.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _updateHeight());
    }
  }

  void _updateHeight() {
    final RenderBox? renderBox = _measuringKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      setState(() {
        _calculatedHeight = renderBox.size.height;
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onDotTapped(int index) {
    if (!widget.showDots) return;
    _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    final effectiveHeight = widget.height ?? _calculatedHeight;

    return Container(
      color: widget.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.height == null && _calculatedHeight == 0 && widget.items.isNotEmpty)
            Offstage(
              child: SizedBox(
                key: _measuringKey,
                width: widget.width ?? MediaQuery.of(context).size.width,
                child: widget.itemBuilder(context, 0, widget.items.first),
              ),
            ),
          SizedBox(
            height: effectiveHeight > 0 ? effectiveHeight : (widget.height ?? 1),
            width: widget.width ?? double.infinity,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.items.length,
              onPageChanged: (index) {
                if (widget.showDots) {
                  setState(() {
                    _currentIndex = index;
                  });
                }
              },
              itemBuilder: (context, index) {
                return widget.itemBuilder(context, index, widget.items[index]);
              },
            ),
          ),
          if (widget.showDots && widget.items.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.items.length, (index) {
                  final isSelected = _currentIndex == index;

                  return GestureDetector(
                    onTap: () => _onDotTapped(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: isSelected ? 10 : 6,
                      width: isSelected ? 10 : 6,
                      decoration: BoxDecoration(
                        color: isSelected ? context.onSurfaceVariant : context.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                }),
              ),
            ),
        ],
      ),
    );
  }
}
