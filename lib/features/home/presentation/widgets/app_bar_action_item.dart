import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../assets/colors.dart';
import '../../../../core/widgets/w_scale.dart';

class AppBarActionItem extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  final Color? backgroundColor;
  const AppBarActionItem({
    required this.onTap,
    required this.icon,
    this.backgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScale(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: backgroundColor,
          border: Border.all(
            width: 1,
            color: borderColor,
          ),
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
