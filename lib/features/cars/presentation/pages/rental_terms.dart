import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:samrental/assets/colors.dart';
import 'package:samrental/assets/constants/constants.dart';
import 'package:samrental/assets/icons.dart';
import 'package:samrental/core/extentions/theme.dart';
import 'package:samrental/core/widgets/w_scale.dart';
import 'package:samrental/generated/locale_keys.g.dart';

class RentalTermsPage extends StatelessWidget {
  const RentalTermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        foregroundColor: white,
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                WScale(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: SvgPicture.asset(
                      AppIcons.iosArrowLeft,
                      color: black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          Text(
            LocaleKeys.rental_terms.tr(),
            style: context.textStyle.fontSize24FontWeight700,
          ),
          const Gap(16),
          Text(
            Constants.rentalTerms,
            style: context.textStyle.fontSize15FontWeight500,
          ),
          // child: SafeArea(
          //   child: HtmlWidget(
          //     Constants.htmlContent,
          //   ),
          // ),
        ],
      ),
    );
  }
}
