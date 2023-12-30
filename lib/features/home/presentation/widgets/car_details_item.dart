import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samrental/core/extentions/theme.dart';

import '../../../../assets/colors.dart';

class CarDetailsItem extends StatelessWidget {
  final String icon;
  final String title;
  const CarDetailsItem({
    required this.icon,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 40,
          child: Align(child: SvgPicture.asset(icon)),
        ),
        Text(
          title.tr(),
          style: context.textStyle.fontSize11FontWeight600.copyWith(
            color: labelColor.withOpacity(.6),
          ),
        ),
      ],
    );
  }
}
