import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:samrental/assets/constants/constants.dart';
import 'package:samrental/core/extentions/theme.dart';
import 'package:samrental/core/functions/functions.dart';
import 'package:samrental/features/cars/presentation/bloc/single_car_bloc.dart';
import 'package:samrental/features/home/domain/entites/car.dart';
import 'package:samrental/features/home/presentation/widgets/car_details.dart';

import '../../../../assets/colors.dart';
import '../../../../assets/icons.dart';
import '../../../../core/widgets/w_button.dart';
import '../../../../generated/locale_keys.g.dart';

class ActualMachineItem extends StatefulWidget {
  final CarEntity car;
  const ActualMachineItem({
    required this.car,
    super.key,
  });

  @override
  State<ActualMachineItem> createState() => _ActualMachineItemState();
}

class _ActualMachineItemState extends State<ActualMachineItem> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SingleCarBloc(),
      child: Builder(builder: (context) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: black.withOpacity(.05),
                blurRadius: 4,
              ),
            ],
          ),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  SizedBox(
                    height: 280,
                    child: PageView(
                      controller: pageController,
                      children: List.generate(
                        widget.car.images.length,
                        (index) => Container(
                          height: 280,
                          width: double.maxFinite,
                          decoration:
                              const BoxDecoration(color: logoBackground),
                          child: CachedNetworkImage(
                            imageUrl:
                                '${Constants.imageBaseUrl}/${widget.car.images[index]}',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 12,
                    top: 12,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: buttonBackgroundColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        widget.car.type,
                        style: context.textStyle.fontSize14FontWeight400
                            .copyWith(color: white),
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
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.car.name,
                      style: context.textStyle.fontSize22FontWeight400,
                    ),
                    const Gap(6),
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.location),
                        const Gap(6),
                        Text(
                          'Landmark Platan restaurant',
                          style: context.textStyle.fontSize15FontWeight400
                              .copyWith(
                            color: headlineMediumTextColor.withOpacity(.5),
                          ),
                        ),
                      ],
                    ),
                    const Gap(16),
                    Text(
                      '${formatPrice(widget.car.cost)} ${LocaleKeys.sum_day.tr()}',
                      style: context.textStyle.fontSize22FontWeight700,
                    ),
                    const Gap(16),
                    Row(
                      children: [
                        Expanded(
                          child: WButton(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                useRootNavigator: true,
                                builder: (bottomSheetContext) {
                                  return BlocProvider.value(
                                    value: context.read<SingleCarBloc>(),
                                    child: Builder(
                                      builder: (context) {
                                        return CarDetails(
                                            pageController: pageController,
                                            widget: widget);
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                            color: scaffoldBackgroundColor,
                            text: LocaleKeys.details,
                            textStyle: context.textStyle.fontSize15FontWeight600
                                .copyWith(
                              color: headlineMediumTextColor.withOpacity(.6),
                            ),
                          ),
                        ),
                        const Gap(6),
                        Expanded(
                          child: WButton(
                            onTap: () {},
                            text: LocaleKeys.reserve,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
