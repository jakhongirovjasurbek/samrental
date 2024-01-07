import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'package:samrental/assets/colors.dart';
import 'package:samrental/core/extentions/theme.dart';
import 'package:samrental/core/widgets/w_bottomsheet.dart';
import 'package:samrental/features/cars/presentation/bloc/single_car_bloc.dart';
import 'package:samrental/generated/locale_keys.g.dart';

import '../../../../core/widgets/w_button.dart';
import '../../../../core/widgets/w_radio.dart';

class ReceiptMethodBottomSheet extends StatefulWidget {
  final bool? isPickup;
  final ValueChanged<bool?> onSave;
  const ReceiptMethodBottomSheet({
    required this.onSave,
    required this.isPickup,
    super.key,
  });

  @override
  State<ReceiptMethodBottomSheet> createState() =>
      _ReceiptMethodBottomSheetState();
}

class _ReceiptMethodBottomSheetState extends State<ReceiptMethodBottomSheet> {
  bool? isPickup;

  @override
  void initState() {
    isPickup = widget.isPickup;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WBottomSheet(
      children: [
        WRadio(
          isActive: isPickup == true,
          onTap: () {
            setState(() {
              isPickup = true;
            });
          },
          title: LocaleKeys.pickup,
        ),
        Container(
          width: double.maxFinite,
          height: 1,
          margin: const EdgeInsets.only(
            left: 16,
            top: 11,
            bottom: 11,
          ),
          color: scaffoldBackgroundColor,
        ),
        WRadio(
          isActive: isPickup == false,
          onTap: () {
            setState(() {
              isPickup = false;
            });
          },
          title: LocaleKeys.delivery,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            LocaleKeys.delivery_info.tr(),
            style: context.textStyle.fontSize13FontWeight400.copyWith(
              color: labelColor.withOpacity(.3),
            ),
          ),
        ),
        const Gap(16),
        if (isPickup == false)
          Container(
            height: 310,
            width: double.maxFinite,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: YandexMap(
                nightModeEnabled: true,
                
                onCameraPositionChanged: (
                  cameraPosition,
                  reason,
                  finished,
                ) async {
                  
                  if (finished) {
                    // final resultWithSession = YandexSearch.searchByPoint(
                    //   point: cameraPosition.target,
                    //   zoom: cameraPosition.zoom.toInt(),
                    //   searchOptions: const SearchOptions(
                    //     searchType: SearchType.direct,
                    //     geometry: false,
                    //   ),
                    // );

                    if (mounted) {
                      context
                          .read<SingleCarBloc>()
                          .add(SingleCarGetSelectedLocation(
                            latitude: cameraPosition.target.latitude,
                            longitude: cameraPosition.target.longitude,
                          ));
                    }
                  }
                },
                onMapCreated: (controller) {
                  context.read<SingleCarBloc>().add(
                        SingleCarGetCurrentLocationEvent(
                          mapController: controller,
                          onSuccess: () {
                          },
                          onFailure: (message) {},
                        ),
                      );
                },
              ),
            ),
          ),
        const Gap(16),
        WButton(
          onTap: () {
            widget.onSave(isPickup);
            Navigator.of(context).pop();
          },
          text: LocaleKeys.save,
        ),
      ],
    );
  }
}
