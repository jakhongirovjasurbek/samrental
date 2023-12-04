import 'package:flutter/material.dart';

class WScale extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final bool isDisabled;
  const WScale({
    required this.child,
    required this.onTap,
    this.isDisabled = false,
    Key? key,
  }) : super(key: key);

  @override
  State<WScale> createState() => _WScaleState();
}

class _WScaleState extends State<WScale> with SingleTickerProviderStateMixin {
  late Animation<double> scale;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    scale = Tween<double>(begin: 1.0, end: 0.98).animate(animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scale,
      builder: (_, child) {
        return ScaleTransition(
          scale: scale,
          child: child,
        );
      },
      child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onPanDown: (_) {
            animationController.forward();
          },
          onPanCancel: () {
            animationController.reverse();
          },
          onPanEnd: (_) {
            animationController.reverse();
          },
          onTap: widget.isDisabled ? null : widget.onTap,
          child: widget.child),
    );
  }
}
