
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:samrental/core/extentions/theme.dart';

import '../../../../assets/colors.dart';

class DetailTitle extends StatelessWidget {
  final String title;
  const DetailTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 0, 8),
      child: Text(
        title.tr().toUpperCase(),
        style: context.textStyle.fontSize13FontWeight500.copyWith(
          color: labelColor.withOpacity(.6),
        ),
      ),
    );
  }
}
