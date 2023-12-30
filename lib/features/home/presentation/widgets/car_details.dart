import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:samrental/core/widgets/w_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:samrental/core/extentions/theme.dart';

import '../../../../assets/colors.dart';
import '../../../../assets/constants/constants.dart';
import '../../../../assets/icons.dart';
import '../../../../core/functions/functions.dart';
import '../../../../core/widgets/w_bottomsheet.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../cars/data/models/single_car.dart';
import '../../../cars/presentation/bloc/single_car_bloc.dart';
import '../bloc/home/home_bloc.dart';
import 'actual_machine_item.dart';
import 'car_details_item.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({
    super.key,
    required this.pageController,
    required this.widget,
  });

  final PageController pageController;
  final ActualMachineItem widget;

  @override
  Widget build(BuildContext context) {
    return WBottomSheet(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      backgroundColor: scaffoldBackgroundColor,
      height: MediaQuery.of(context).size.height * 0.85,
      isScrollable: true,
      bottomNavigation: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: black.withOpacity(.05), blurRadius: 4)],
        ),
      ),
      children: [
        Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            SizedBox(
              height: 296,
              child: PageView(
                controller: pageController,
                children: List.generate(
                  widget.car.images.length,
                  (index) => Container(
                    height: 296,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      color: logoBackground,
                    ),
                    child: CachedNetworkImage(
                      imageUrl:
                          '${Constants.imageBaseUrl}/${widget.car.images[index]}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 12,
              child: Align(
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: widget.car.images.length,
                  effect: JumpingDotEffect(
                    dotWidth: 8,
                    dotHeight: 8,
                    activeDotColor: headlineMediumTextColor,
                    dotColor: headlineMediumTextColor.withOpacity(.2),
                    spacing: 8,
                  ),
                ),
              ),
            ),
          ],
        ),
        BlocBuilder<SingleCarBloc, SingleCarState>(
          builder: (context, state) {
            if (state.status == LoadingStatus.pure) {
              context.read<SingleCarBloc>().add(SingleCarStarted(
                    id: widget.car.id,
                    onFailure: (message) {},
                  ));
              return const SizedBox();
            } else if (state.status == LoadingStatus.loading) {
              return const SizedBox();
            } else if (state.status == LoadingStatus.loadedWithSuccess) {
              final car = state.singleCar as SingleCarModel;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: black.withOpacity(.05),
                          blurRadius: 4,
                        )
                      ],
                    ),
                    child: Column(children: [
                      Row(children: [
                        Text(
                          car.type,
                          style: context.textStyle.fontSize11FontWeight600
                              .copyWith(
                            color: labelColor.withOpacity(.6),
                          ),
                        ),
                        Container(
                          width: 4,
                          height: 4,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: headlineMediumTextColor.withOpacity(.5),
                          ),
                        ),
                        Text(
                          car.name,
                          style: context.textStyle.fontSize11FontWeight600
                              .copyWith(
                            color: labelColor.withOpacity(.6),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: buttonBackgroundColor,
                          ),
                          child: Text(
                            'New',
                            style: context.textStyle.fontSize11FontWeight600
                                .copyWith(color: white),
                          ),
                        )
                      ]),
                      const Gap(12),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              car.name,
                              style: context.textStyle.fontSize20FontWeight600,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            '${formatPrice(car.cost)} ${LocaleKeys.sum_day.tr()}',
                            style: context.textStyle.fontSize20FontWeight400,
                          ),
                        ],
                      )
                    ]),
                  ),
                  const Gap(12),
                  Container(
                    width: double.maxFinite,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(
                          color: black.withOpacity(.05),
                          blurRadius: 4,
                        )
                      ],
                    ),
                    child: Row(children: [
                      Expanded(
                        child: CarDetailsItem(
                          icon: AppIcons.person,
                          title: LocaleKeys.places_count.tr(
                            args: ['${car.place}'],
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: .5,
                        color: const Color(0xFFB4B4CF).withOpacity(.3),
                      ),
                      Expanded(
                        child: CarDetailsItem(
                          icon: AppIcons.bag,
                          title: LocaleKeys.baggage_count.tr(
                            args: ['${car.baggage}'],
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: .5,
                        color: const Color(0xFFB4B4CF).withOpacity(.3),
                      ),
                      Expanded(
                        child: CarDetailsItem(
                          icon: car.fuelType != 'gasoline'
                              ? AppIcons.methane
                              : AppIcons.gasoline,
                          title: getFuelType(car.fuelType),
                        ),
                      )
                    ]),
                  ),
                  const Gap(1),
                  Container(
                    width: double.maxFinite,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(
                          color: black.withOpacity(.05),
                          blurRadius: 4,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: CarDetailsItem(
                            icon: car.conditioner
                                ? AppIcons.conditioner
                                : AppIcons.noConditioner,
                            title: car.conditioner
                                ? LocaleKeys.conditioner
                                : LocaleKeys.no_conditioner,
                          ),
                        ),
                        Container(
                          height: 40,
                          width: .5,
                          color: const Color(0xFFB4B4CF).withOpacity(.3),
                        ),
                        Expanded(
                          child: CarDetailsItem(
                            icon: AppIcons.speed,
                            title:
                                '${car.maxSpeed} ${LocaleKeys.km_per_hour.tr()}',
                          ),
                        ),
                        Container(
                          height: 40,
                          width: .5,
                          color: const Color(0xFFB4B4CF).withOpacity(.3),
                        ),
                        Expanded(
                          child: CarDetailsItem(
                            icon: car.tinting
                                ? AppIcons.tinting
                                : AppIcons.noTinting,
                            title: car.tinting
                                ? LocaleKeys.tinting.tr()
                                : LocaleKeys.no_tinting.tr(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 0, 8),
          child: Text(
            LocaleKeys.details.tr().toUpperCase(),
            style: context.textStyle.fontSize13FontWeight500.copyWith(
              color: labelColor.withOpacity(.6),
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
          decoration: BoxDecoration(
            color: white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: black.withOpacity(.05),
                blurRadius: 4,
              )
            ],
          ),
          child: Column(
            children: [
              CarDocsItem(
                title: LocaleKeys.rental_terms,
                onTap: () {},
              ),
              Container(
                width: double.maxFinite,
                height: 1,
                margin: const EdgeInsets.only(left: 16),
                color: scaffoldBackgroundColor,
              ),
              CarDocsItem(
                onTap: () {},
                title: LocaleKeys.insurance,
                isIncluded: true,
              ),
              Container(
                width: double.maxFinite,
                height: 1,
                margin: const EdgeInsets.only(left: 16),
                color: scaffoldBackgroundColor,
              ),
              CarDocsItem(
                title: LocaleKeys.owner,
                onTap: () {},
              ),
              Container(
                width: double.maxFinite,
                height: 1,
                color: scaffoldBackgroundColor,
              ),
              const Gap(16),
              Row(
                children: [
                  const Gap(16),
                  Expanded(
                    child: WButton(
                      onTap: () {},
                      color: tentiary.withOpacity(.12),
                      text: LocaleKeys.reserve,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppIcons.call),
                          const Gap(4),
                          Text(
                            LocaleKeys.call.tr(),
                            style: context.textStyle.fontSize17FontWeight400
                                .copyWith(
                              color: headlineMediumTextColor.withOpacity(.6),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Gap(8),
                  Expanded(
                    child: WButton(
                      onTap: () {},
                      text: LocaleKeys.reserve,
                    ),
                  ),
                  const Gap(16),
                ],
              ),
              const Gap(16),
            ],
          ),
        ),
      ],
    );
  }

  String getFuelType(String fuelType) {
    if (fuelType == 'gasoline') {
      return LocaleKeys.gasoil;
    } else {
      return LocaleKeys.gas;
    }
  }
}

class CarDocsItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isIncluded;
  const CarDocsItem({
    required this.title,
    required this.onTap,
    this.isIncluded = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 11,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title.tr(),
                style: context.textStyle.fontSize17FontWeight400,
              ),
            ),
            if (isIncluded)
              Text(
                LocaleKeys.included.tr(),
                style: context.textStyle.fontSize17FontWeight400.copyWith(
                  color: const Color(0xFF34C759),
                ),
              ),
            const Gap(14),
            SvgPicture.asset(AppIcons.rightArrow),
          ],
        ),
      ),
    );
  }
}
