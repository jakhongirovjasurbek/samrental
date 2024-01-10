import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gap/gap.dart';
import 'package:samrental/assets/colors.dart';
import 'package:samrental/assets/constants/constants.dart';
import 'package:samrental/core/extentions/theme.dart';
import 'package:samrental/generated/locale_keys.g.dart';

class RentalTermsPage extends StatelessWidget {
  const RentalTermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 64),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  LocaleKeys.rental_terms.tr(),
                  style: context.textStyle.fontSize24FontWeight700,
                  textAlign: TextAlign.left,
                ),
                const Gap(16),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: SafeArea(
            child: HtmlWidget(
              Constants.htmlContent,
            ),
          ),
        ),
      ),
    );
  }
}
