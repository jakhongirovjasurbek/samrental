import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:samrental/assets/colors.dart';
import 'package:samrental/assets/icons.dart';
import 'package:samrental/core/extentions/theme.dart';
import 'package:samrental/core/widgets/w_button.dart';
import 'package:samrental/core/widgets/w_shimmer.dart';
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
              // CachedNetworkImage(
              //   imageUrl:
              //       'https://s3-alpha-sig.figma.com/img/37e1/ea11/c7c3c20dfcc8b9a16fb0965d8ba490b6?Expires=1706486400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=FWb20zFYbobWk0moFwUntYaezE3ruCo8nDaUJWLxcIiBOW3En-r-to3AR1T6A9c97vdtLr6AEOImtwNBCVddWaybAxOdPO6bg7pFe~4RV0p-eYXdj5UXM-aKwTzznRmQnPsPZDQgW3c~2FfQBGQcG9Ry7gLwEp2IdSZjA5g-~REELiPHS1heweq~3SJ8PBLO5rFtIstLZnFU9H-5QJTTnIQDsiYNIVl6nR3j94kSOM8hg5TTW0I5xxIgD3SSgD-oQXlDyDd-VFzBeiX6A5~~ae30vXnMBFSlPY0Cb8YsMe-ws0ylW2WNM2oQXHjkXNY9rbrn7iPTkCeBhLV3Mu8lzg__',
              //   width: 200,
              //   height: 200,
              //   progressIndicatorBuilder: (_, __, ___) => const WShimmer(
              //     width: 200,
              //     height: 200,
              //   ),
              // loadingBuilder: (_, child, progress) {
              //   if(progress == null){
              //     return const WShimmer(
              //       width: 200,
              //       height: 200,
              //     );
              //   } else {
              //     return Center(child: child);
              //   }
              // },
              // ),
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
              MediaQuery.of(context).padding.bottom,
            ),
            child: WButton(
              color: const Color(0xFF767680).withOpacity(.12),
              textStyle: context.textStyle.fontSize17FontWeight400
                  .copyWith(color: headlineMediumTextColor.withOpacity(.6)),
              onTap: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
              },
              text: LocaleKeys.back_to_home,
            ),
          ),
        ],
      ),
    );
  }
}
