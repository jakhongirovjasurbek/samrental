import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:samrental/core/extentions/theme.dart';
import 'package:samrental/core/functions/functions.dart';
import 'package:samrental/features/cars/data/models/single_car.dart';
import 'package:samrental/features/cars/presentation/widgets/reserve_app_bar.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../assets/colors.dart';
import '../../../../assets/icons.dart';
import '../../../../core/widgets/w_button.dart';
import '../../../../core/widgets/w_radio.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../home/presentation/widgets/car_details.dart';
import '../bloc/single_car_bloc.dart';
import 'date_picker.dart';
import 'detail_title.dart';
import 'receipit_method_bottom_sheet.dart';

class ReserveSubPage extends StatefulWidget {
  const ReserveSubPage({super.key});

  @override
  State<ReserveSubPage> createState() => _ReserveSubPageState();
}

class _ReserveSubPageState extends State<ReserveSubPage> {
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  bool? isCash;
  DateTime? startingPeriod;
  DateTime? endingPeriod;
  bool? isPickup;
  YandexMapController? controller;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) =>
          [const ReserveAppBar()],
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DetailTitle(title: LocaleKeys.rental_period),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                WDatePicker(
                  initialDateTime: startingPeriod,
                  maximumDate: endingPeriod,
                  onSavePressed: (value) {
                    setState(() {
                      startingPeriod = value;
                    });
                  },
                ),
                const Gap(16),
                WDatePicker(
                  initialDateTime: endingPeriod,
                  onSavePressed: (value) {
                    setState(() {
                      endingPeriod = value;
                    });
                  },
                  minimumDate: startingPeriod,
                ),
              ],
            ),
          ),
          const DetailTitle(title: LocaleKeys.personal_details),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                TextField(
                  controller: fullNameController,
                  style: context.textStyle.fontSize17FontWeight400,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: logoBackground,
                    labelStyle:
                        context.textStyle.fontSize17FontWeight400.copyWith(
                      color: c8B8B8C,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    labelText: LocaleKeys.full_name.tr(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: companyLogoBorderColor,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: companyLogoBorderColor,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const Gap(16),
                TextField(
                  controller: phoneNumberController,
                  style: context.textStyle.fontSize17FontWeight400,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: logoBackground,
                    labelStyle:
                        context.textStyle.fontSize17FontWeight400.copyWith(
                      color: c8B8B8C,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    labelText: LocaleKeys.phone_number.tr(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: companyLogoBorderColor,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: companyLogoBorderColor,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const DetailTitle(title: LocaleKeys.payment_method),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                WRadio(
                  isActive: isCash == true,
                  onTap: () {
                    setState(() {
                      isCash = true;
                    });
                  },
                  title: LocaleKeys.cash,
                ),
                Container(
                  width: double.maxFinite,
                  height: 1,
                  margin: const EdgeInsets.only(left: 16, top: 11, bottom: 11),
                  color: scaffoldBackgroundColor,
                ),
                WRadio(
                  isActive: isCash == false,
                  onTap: () {
                    setState(() {
                      isCash = false;
                    });
                  },
                  title: LocaleKeys.credit_card,
                  trailing: [
                    SvgPicture.asset(AppIcons.payme),
                  ],
                ),
              ],
            ),
          ),
          const Gap(16),
          Container(
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (btshContext) {
                    return BlocProvider.value(
                      value: context.read<SingleCarBloc>(),
                      child: ReceiptMethodBottomSheet(
                        isPickup: isPickup,
                        onSave: (value) {
                          setState(() {
                            isPickup = value;
                          });
                        },
                      ),
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 11,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        LocaleKeys.pickup.tr(),
                        style: context.textStyle.fontSize17FontWeight400,
                      ),
                    ),
                    Text(
                      isPickup == null
                          ? LocaleKeys.select.tr()
                          : isPickup == true
                              ? LocaleKeys.pickup.tr()
                              : LocaleKeys.delivery.tr(),
                      style: context.textStyle.fontSize15FontWeight400.copyWith(
                          color: headlineMediumTextColor.withOpacity(.5)),
                    ),
                    const Gap(14),
                    SvgPicture.asset(AppIcons.rightArrow),
                  ],
                ),
              ),
            ),
          ),
          const DetailTitle(title: LocaleKeys.details),
          Container(
            width: double.maxFinite,
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
            child: Column(
              children: [
                CarDocsItem(
                  title: LocaleKeys.rental_terms,
                  onTap: () {
                    Navigator.of(context).pushNamed('/rental_terms');
                  },
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
                BlocBuilder<SingleCarBloc, SingleCarState>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 11,
                      ),
                      child: Row(
                        children: [
                          Text(
                            LocaleKeys.total.tr(),
                            style: context.textStyle.fontSize17FontWeight500,
                          ),
                          const Spacer(),
                          Text(
                            '${formatPrice((state.singleCar as SingleCarModel).cost * ((endingPeriod?.day ?? 0) - (startingPeriod?.day ?? 0)))} ${LocaleKeys.sum.tr()}',
                            style: context.textStyle.fontSize17FontWeight700,
                          )
                        ],
                      ),
                    );
                  },
                ),
                const Gap(16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: WButton(
                    onTap: () {},
                    text: LocaleKeys.reserve,
                  ),
                ),
                const Gap(16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
