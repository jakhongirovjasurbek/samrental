import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samrental/core/extentions/theme.dart';

import '../../../../assets/icons.dart';
import '../../../../core/widgets/w_scale.dart';

class HomeTitlerItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool excludeArrowButton;
  const HomeTitlerItem({
    required this.onTap,
    required this.title,
    this.excludeArrowButton = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24,
        bottom: 12,
        left: 16,
        right: 16,
      ),
      child: Row(
        children: [
          Text(
            title.tr(),
            style: context.textStyle.fontSize22FontWeight700,
          ),
          const Spacer(),
          if (!excludeArrowButton)
            WScale(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: SvgPicture.asset(AppIcons.rightArrow),
              ),
            )
        ],
      ),
    );
  }
}
