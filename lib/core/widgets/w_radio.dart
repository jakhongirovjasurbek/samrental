import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:samrental/core/extentions/theme.dart';

import '../../assets/colors.dart';
import '../../assets/icons.dart';

class WRadio extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;
  final List<Widget>? trailing;
  final String title;
  const WRadio({
    required this.isActive,
    required this.onTap,
    required this.title,
    this.trailing,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? buttonBackgroundColor : null,
              border: Border.all(
                width: 1,
                color: isActive
                    ? buttonBackgroundColor
                    : headlineMediumTextColor.withOpacity(.4),
              ),
            ),
            child: isActive ? SvgPicture.asset(AppIcons.checked) : null,
          ),
          const Gap(9),
          Text(
            title.tr(),
            style: context.textStyle.fontSize16FontWeight400,
          ),
          const Spacer(),
          if (trailing != null) ...{
            ...trailing!,
          }
        ],
      ),
    );
  }
}
