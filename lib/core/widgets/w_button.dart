import 'package:flutter/material.dart';

import 'package:samrental/core/widgets/w_scale.dart';

class WButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback onTap;
  final String text;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  const WButton({
    required this.onTap,
    this.child,
    this.text = '',
    this.textStyle,
    this.width,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WScale(
      onTap: onTap,
      child: child ??
          Container(
            width: width ?? double.maxFinite,
            height: height ?? 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
            ),
            child: Text(
              text,
              style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
            ),
          ),
    );
  }
}
