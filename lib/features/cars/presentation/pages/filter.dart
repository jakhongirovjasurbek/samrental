import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samrental/assets/colors.dart';
import 'package:samrental/core/extentions/theme.dart';
import 'package:samrental/core/widgets/w_button.dart';
import 'package:samrental/features/cars/presentation/bloc/filter/filter_bloc.dart';
import 'package:samrental/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:samrental/generated/locale_keys.g.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_outlined,
            color: black,
            size: 18,
          ),
        ),
        title: Text(
          'Filter',
          style: context.textStyle.fontSize18FontWeight500,
        ),
        backgroundColor: white,
        elevation: 0,
      ),
      body: BlocListener<HomeBloc, HomeState>(
        listenWhen: (previous, current) =>
            previous.filterStatus != current.filterStatus,
        listener: (context, state) {
          Navigator.of(context).pop();
        },
        child: BlocListener<FilterBloc, FilterState>(
          listener: (context, state) {
            if (state.status == FilterLoadingStatus.loadedWithSuccess) {
              context.read<HomeBloc>().add(
                    UpdateCarsEvent(
                      cars: state.cars,
                    ),
                  );
            }
          },
          child: BlocBuilder<FilterBloc, FilterState>(
            builder: (context, state) {
              return SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Ink(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: white,
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(context.tr('allTypes')),
                              trailing: state.allTypeCars
                                  ? const Icon(
                                      Icons.check_box,
                                      size: 24,
                                      color: buttonBackgroundColor,
                                    )
                                  : null,
                              onTap: () {
                                context.read<FilterBloc>().add(
                                      const SelectCarTypesEvent(
                                        type: CarsType.allCars,
                                      ),
                                    );
                              },
                            ),
                            const Divider(
                              thickness: 1,
                              color: textFieldBorderColor,
                            ),
                            ListTile(
                              title: Text(context.tr('standard')),
                              trailing: state.standardType ?? false
                                  ? const Icon(
                                      Icons.check_box,
                                      size: 24,
                                      color: buttonBackgroundColor,
                                    )
                                  : null,
                              onTap: () {
                                context.read<FilterBloc>().add(
                                      const SelectCarTypesEvent(
                                        type: CarsType.standardType,
                                      ),
                                    );
                              },
                            ),
                            const Divider(
                              thickness: 1,
                              color: textFieldBorderColor,
                            ),
                            ListTile(
                              title: Text(context.tr('comfort')),
                              trailing: state.comfortType ?? false
                                  ? const Icon(
                                      Icons.check_box,
                                      size: 24,
                                      color: buttonBackgroundColor,
                                    )
                                  : null,
                              onTap: () {
                                context.read<FilterBloc>().add(
                                      const SelectCarTypesEvent(
                                        type: CarsType.comfortType,
                                      ),
                                    );
                              },
                            ),
                            const Divider(
                              thickness: 1,
                              color: textFieldBorderColor,
                            ),
                            ListTile(
                              title: Text(context.tr('business')),
                              trailing: state.businessType ?? false
                                  ? const Icon(
                                      Icons.check_box,
                                      size: 24,
                                      color: buttonBackgroundColor,
                                    )
                                  : null,
                              onTap: () {
                                context.read<FilterBloc>().add(
                                      const SelectCarTypesEvent(
                                        type: CarsType.businessType,
                                      ),
                                    );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: WButton(
                        onTap: () {
                          context.read<FilterBloc>().add(
                                FilterButtonPressedEvent(
                                  cars: context.read<HomeBloc>().state.allCars,
                                ),
                              );
                        },
                        text: LocaleKeys.filter,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
