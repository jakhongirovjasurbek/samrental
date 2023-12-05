import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../assets/colors.dart';
import '../../../../assets/icons.dart';
import '../../../../core/widgets/w_button.dart';

class ActualMachineList extends StatefulWidget {
  const ActualMachineList({
    super.key,
  });

  @override
  State<ActualMachineList> createState() => _ActualMachineListState();
}

class _ActualMachineListState extends State<ActualMachineList> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 280,
                child: PageView(
                  controller: pageController,
                  children: List.generate(
                    4,
                    (index) => Container(
                      height: 280,
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                        color: logoBackground,
                      ),
                      child: Image.asset(AppIcons.car),
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
                    'Premium',
                    style: Theme.of(context).textTheme.labelMedium,
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
                    count: 4,
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
                  'Hyundai Elantra',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                ),
                const Gap(6),
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.location),
                    const Gap(2),
                    Text(
                      'Landmark Platan restaurant',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: headlineMediumTextColor.withOpacity(.5),
                          ),
                    ),
                  ],
                ),
                const Gap(16),
                Text(
                  '900,000 sum/h',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(),
                ),
                const Gap(16),
                Row(
                  children: [
                    Expanded(
                      child: WButton(
                        onTap: () {},
                        color: scaffoldBackgroundColor,
                        text: 'Details',
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                              color: headlineMediumTextColor.withOpacity(.6),
                            ),
                      ),
                    ),
                    const Gap(6),
                    Expanded(
                      child: WButton(
                        onTap: () {},
                        text: 'Reserve',
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
  }
}
