
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:samrental/assets/colors.dart';
import 'package:samrental/assets/constants/constants.dart';
import 'package:samrental/assets/icons.dart';
import 'package:samrental/core/extentions/theme.dart';
import 'package:samrental/core/functions/functions.dart';
import 'package:samrental/core/widgets/w_scale.dart';
import 'package:samrental/features/cars/data/models/single_car.dart';
import 'package:samrental/features/cars/presentation/bloc/single_car_bloc.dart';
import 'package:samrental/generated/locale_keys.g.dart';


class ReserveAppBar extends StatelessWidget {
  const ReserveAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: white),
      toolbarHeight: kToolbarHeight,
      expandedHeight: 157,
      elevation: 2,
      shadowColor: Colors.black,
      foregroundColor: white,
      backgroundColor: white,
      title: Container(
        height: kToolbarHeight,
        color: white,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WScale(
              onTap: () => Navigator.of(context).pop(),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.iosArrowLeft,
                    height: 18,
                  ),
                  const Gap(6),
                  Text(
                    LocaleKeys.back.tr(),
                    style: context.textStyle.fontSize17FontWeight400.copyWith(
                        color: headlineMediumTextColor.withOpacity(.6)),
                  )
                ],
              ),
            ),
            const Gap(4),
            Text(
              LocaleKeys.booking_car.tr(),
              style: context.textStyle.fontSize22FontWeight700,
            ),
          ],
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        
        titlePadding: const EdgeInsets.all(8),
        expandedTitleScale: 1,
        title: BlocBuilder<SingleCarBloc, SingleCarState>(
          builder: (context, state) {
            final car = (state.singleCar as SingleCarModel);
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 88,
                  height: 64,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: '${Constants.imageBaseUrl}/${car.images.first}',
                  ),
                ),
                const Gap(16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        car.name,
                        style: context.textStyle.fontSize17FontWeight400,
                      ),
                      const Gap(7),
                      Text(
                        '${formatPrice(car.cost)} ${LocaleKeys.sum_day.tr()}',
                        style: context.textStyle.fontSize13FontWeight600
                            .copyWith(color: labelColor.withOpacity(.6)),
                      ),
                    ],
                  ),
                ),
                Text(
                  car.type,
                  style: context.textStyle.fontSize11FontWeight600
                      .copyWith(color: cFFAA01),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
