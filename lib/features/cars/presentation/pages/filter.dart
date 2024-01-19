import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:samrental/assets/colors.dart';
import 'package:samrental/core/extentions/theme.dart';
import 'package:samrental/core/widgets/w_button.dart';
import 'package:samrental/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:samrental/generated/locale_keys.g.dart';

import '../../../../assets/constants/constants.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<String> types = [];

  @override
  void initState() {
    types = [...context.read<HomeBloc>().state.selectedTypes];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
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
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...List.generate(
                Constants.types.length,
                (index) => GestureDetector(
                  onTap: () {
                    if (types.contains(Constants.types[index])) {
                      types.remove(Constants.types[index]);
                    } else {
                      types.add(Constants.types[index]);
                    }
                    setState(() {});
                  },
                  child: Container(
                    width: double.maxFinite,
                    height: 52,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    child: Row(
                      children: [
                        WCheckBox(
                          isActive: types.contains(Constants.types[index]),
                        ),
                        const Gap(8),
                        Text(
                          Constants.types[index],
                          style: context.textStyle.fontSize16FontWeight500,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: WButton(

                  onTap: () {
                    context
                        .read<HomeBloc>()
                        .add(HomeUpdateCarsEvent(selectedTypes: types));
                    Navigator.of(context).pop();
                  },
                  text: LocaleKeys.save,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class WCheckBox extends StatelessWidget {
  final bool isActive;

  const WCheckBox({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      // clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.all(4),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          width: 1,
          color: buttonBackgroundColor,
        ),
      ),
      child: isActive
          ? const Align(
              child: Icon(
                Icons.check,
                color: buttonBackgroundColor,
                size: 12,
              ),
            )
          : null,
    );
  }
}
