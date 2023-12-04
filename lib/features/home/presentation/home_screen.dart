import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../assets/icons.dart';
import 'widgets/app_bar_action_item.dart';
import 'widgets/home_carousel.dart';

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
            child: Row(
              children: [
                const Gap(16),
                Text(
                  'Sam Rental',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Spacer(),
                AppBarActionItem(
                  onTap: () {},
                  icon: AppIcons.phone,
                ),
                const Gap(12),
                AppBarActionItem(
                  onTap: () {},
                  icon: AppIcons.notification,
                ),
                const Gap(7),
              ],
            ),
          ),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 4),
          children: [
            HomeCarousel(),
          ],
        ),
      ),
    );
  }
}
