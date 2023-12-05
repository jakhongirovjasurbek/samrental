import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../assets/colors.dart';
import '../../../assets/icons.dart';
import '../../../core/widgets/w_scale.dart';
import 'widgets/actual_machine_list.dart';
import 'widgets/app_bar_action_item.dart';
import 'widgets/company_info.dart';
import 'widgets/home_carousel.dart';
import 'widgets/home_titler_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(86),
          child: Padding(
            padding: const EdgeInsets.only(top: 22, bottom: 16),
            child: AppBarContent(),
          ),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 4),
          children: [
            const HomeCarousel(),
            const Gap(4),
            HomeTitlerItem(title: 'Companies', onTap: () {}),
            const CompanyItem(),
            HomeTitlerItem(
              onTap: () {},
              title: 'Actual machines',
              excludeArrowButton: true,
            ),
            ...List.generate(
              3,
              (index) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: ActualMachineList(),
              ),
            ),
            Align(
              child: WScale(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'All cars ',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const Gap(4),
                      SvgPicture.asset(
                        AppIcons.rightArrow,
                        color: buttonBackgroundColor,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AppBarContent extends StatelessWidget {
  final Color? actionItemBackgroundColor;
  const AppBarContent({
    this.actionItemBackgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Gap(16),
        Text(
          'Sam Rental',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Spacer(),
        AppBarActionItem(
          backgroundColor: actionItemBackgroundColor,
          onTap: () {},
          icon: AppIcons.phone,
        ),
        const Gap(12),
        AppBarActionItem(
          backgroundColor: actionItemBackgroundColor,
          onTap: () {},
          icon: AppIcons.notification,
        ),
        const Gap(7),
      ],
    );
  }
}
