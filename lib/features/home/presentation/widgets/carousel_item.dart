import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:samrental/assets/colors.dart';
import 'package:samrental/core/extentions/theme.dart';

import '../../../../assets/icons.dart';
import '../../../../generated/locale_keys.g.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 288,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF131229),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 16,
            left: 16,
            right: 100,
            child: Text(
              LocaleKeys.slide_one_description.tr(),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: context.textStyle.fontSize24FontWeight600.copyWith(
                color: white,
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(AppIcons.audi),
          ),
        ],
      ),
    );
  }
}
