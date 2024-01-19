import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:samrental/core/extentions/theme.dart';
import 'package:samrental/features/home/presentation/widgets/home_carousel.dart';

import '../../../../assets/icons.dart';

class CarouselItem extends StatelessWidget {
  final CarouselItemEntity item;

  const CarouselItem({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 288,
      clipBehavior: Clip.hardEdge,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            top: item.image == AppIcons.iphone ? 100 : 59,
            left: 41,
            right: 0,
            bottom:item.image == AppIcons.iphone ? -100 : 0,
            child: Image.asset(
              item.image,
              fit: item.image == AppIcons.iphone ? BoxFit.fill : BoxFit.fitWidth,
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Text(
              item.text.tr(),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: context.textStyle.fontSize24FontWeight600.copyWith(
                color: item.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
