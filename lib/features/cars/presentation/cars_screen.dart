import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:samrental/assets/icons.dart';
import 'package:samrental/core/extentions/theme.dart';
import 'package:samrental/core/widgets/w_scale.dart';
import 'package:samrental/features/home/presentation/widgets/actual_machine_item.dart';

import '../../../assets/colors.dart';
import '../../../generated/locale_keys.g.dart';
import '../../home/presentation/bloc/home/home_bloc.dart';
import '../../home/presentation/widgets/app_bar_content.dart';

class CarsScreen extends StatefulWidget {
  const CarsScreen({super.key});

  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (_, __) => [
            SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              primary: true,
              backgroundColor: white,
              expandedHeight: 132,
              toolbarHeight: 60,
              title: const Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: AppBarContent(actionItemBackgroundColor: logoBackground),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.5, 10, 8.5, 16),
                      child: WScale(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            '/filter',
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: logoBackground,
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(
                              width: 1,
                              color: textFieldBorderColor,
                            ),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(AppIcons.filter),
                              const Gap(6),
                              Text(
                                LocaleKeys.filter.tr(),
                                style:
                                    context.textStyle.fontSize16FontWeight500,
                              ),
                              const Spacer(),
                              SvgPicture.asset(AppIcons.rightArrow),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return ListView.separated(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                padding: const EdgeInsets.only(top: 12, bottom: 50),
                itemBuilder: (_, index) => ActualMachineItem(
                  car: state.cars[index],
                ),
                separatorBuilder: (_, __) => const Gap(12),
                itemCount: state.cars.length,
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
