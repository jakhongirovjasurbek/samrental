import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:samrental/assets/colors.dart';
import 'package:samrental/assets/icons.dart';
import 'package:samrental/core/extentions/theme.dart';
import 'package:samrental/core/widgets/w_button.dart';
import 'package:samrental/generated/locale_keys.g.dart';

class ReservationSuccessPage extends StatelessWidget {
  const ReservationSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 48),
          Column(
            children: [
              Image.asset(
                AppIcons.success,
                width: 200,
                height: 200,
              ),
              const Gap(16),
              Text(
                LocaleKeys.successful_reservation.tr(),
                textAlign: TextAlign.center,
                style: context.textStyle.fontSize22FontWeight700,
              ),
              const Gap(16),
              Text(
                LocaleKeys.successful_reservation_detail.tr(),
                textAlign: TextAlign.center,
                style: context.textStyle.fontSize15FontWeight400
                    .copyWith(color: headlineMediumTextColor.withOpacity(.5)),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              16,
              16,
              16,
              MediaQuery.of(context).padding.bottom + 16,
            ),
            child: WButton(
              color: const Color(0xFF767680).withOpacity(.12),
              textStyle: context.textStyle.fontSize17FontWeight400
                  .copyWith(color: headlineMediumTextColor.withOpacity(.6)),
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/',
                  (route) => false,
                );
              },
              text: LocaleKeys.back_to_home,
            ),
          ),
        ],
      ),
    );
  }
}
