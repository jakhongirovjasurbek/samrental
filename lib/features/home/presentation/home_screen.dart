import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:samrental/core/extentions/theme.dart';
import 'package:samrental/features/home/presentation/bloc/home/home_bloc.dart';

import '../../../assets/colors.dart';
import '../../../assets/icons.dart';
import '../../../core/widgets/w_scale.dart';
import '../../../generated/locale_keys.g.dart';
import 'widgets/actual_machine_item.dart';
import 'widgets/app_bar_content.dart';
import 'widgets/company_info.dart';
import 'widgets/home_carousel.dart';
import 'widgets/home_titler_item.dart';

class HomeScreen extends StatefulWidget {
  final PageController pageController;
  const HomeScreen({
    required this.pageController,
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(86),
          child: Padding(
            padding: EdgeInsets.only(top: 22, bottom: 16),
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
            HomeTitlerItem(
              title: LocaleKeys.companies,
              onTap: () {},
              excludeArrowButton: true,
            ),
            const CompanyItem(),
            HomeTitlerItem(
              onTap: () {},
              title: LocaleKeys.actual_machines,
              excludeArrowButton: true,
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state.status == LoadingStatus.pure) {
                  context.read<HomeBloc>().add(
                        HomeStarted(
                          onFailure: (errorMessage) {},
                        ),
                      );
                  return const Align(child: CupertinoActivityIndicator());
                } else if (state.status == LoadingStatus.loading) {
                  return const Align(child: CupertinoActivityIndicator());
                } else if (state.status == LoadingStatus.loadedWithSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      state.cars.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: ActualMachineItem(car: state.cars[index]),
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            Align(
              child: WScale(
                onTap: () {
                  widget.pageController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.all_cars.tr(),
                        style:
                            context.textStyle.fontSize17FontWeight500.copyWith(
                          color: buttonBackgroundColor,
                        ),
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
