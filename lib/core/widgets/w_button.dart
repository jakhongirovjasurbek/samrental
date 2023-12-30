import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:samrental/core/extentions/theme.dart';

import 'package:samrental/core/widgets/w_scale.dart';

import '../../assets/colors.dart';

class WButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback onTap;
  final String text;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final Color? color;
  const WButton({
    required this.onTap,
    this.child,
    this.text = '',
    this.textStyle,
    this.width,
    this.height,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WScale(
      onTap: onTap,
      child: Container(
        width: width ?? double.maxFinite,
        height: height ?? 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color ?? buttonBackgroundColor,
          borderRadius: BorderRadius.circular(11),
        ),
        child: child ??
            Text(
              text.tr(),
              style: textStyle ??
                  context.textStyle.fontSize15FontWeight600
                      .copyWith(color: white),
            ),
      ),
    );
  }
}
