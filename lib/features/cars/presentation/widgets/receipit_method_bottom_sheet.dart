import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:samrental/assets/colors.dart';
import 'package:samrental/core/extentions/theme.dart';
import 'package:samrental/core/widgets/w_bottomsheet.dart';
import 'package:samrental/features/cars/presentation/bloc/single_car_bloc.dart';
import 'package:samrental/generated/locale_keys.g.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

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
  late List<MapObject> mapObjects;
  late MapAnimation animation;

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
            child: BlocBuilder<SingleCarBloc, SingleCarState>(
              builder: (context, state) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: [
                      YandexMap(
                        nightModeEnabled: true,
                        mapType: state.mapType,
                        onCameraPositionChanged: (
                          cameraPosition,
                          reason,
                          finished,
                        ) async {
                          if (finished) {
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
                                  onSuccess: () {},
                                  onFailure: (message) {},
                                ),
                              );
                        },
                      ),

                      /// Location mark
                      Center(
                        child: SvgPicture.asset(
                          'assets/icons/place_marker.svg',
                        ),
                      ),

                      /// Map type (Map, Satellite)
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, top: 12),
                          child: Material(
                            borderRadius: BorderRadius.circular(8),
                            color: white.withOpacity(0.85),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    context.read<SingleCarBloc>().add(
                                          const ChangeMapViewEvent(
                                            mapType: MapType.map,
                                          ),
                                        );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Map',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: state.mapType == MapType.map
                                            ? FontWeight.w500
                                            : FontWeight.w400,
                                        color: state.mapType == MapType.map
                                            ? black
                                            : lightGrey,
                                      ),
                                    ),
                                  ),
                                ),
                                const Gap(8),
                                Container(
                                  height: 28,
                                  width: 1,
                                  color: grey,
                                ),
                                const Gap(8),
                                GestureDetector(
                                  onTap: () {
                                    context.read<SingleCarBloc>().add(
                                          const ChangeMapViewEvent(
                                            mapType: MapType.satellite,
                                          ),
                                        );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Satellite',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight:
                                            state.mapType == MapType.satellite
                                                ? FontWeight.w500
                                                : FontWeight.w400,
                                        color:
                                            state.mapType == MapType.satellite
                                                ? black
                                                : lightGrey,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      /// Zoom in, Zoom out buttons (plus, minus)
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12, top: 12),
                          child: Column(
                            children: [
                              Material(
                                borderRadius: BorderRadius.circular(8),
                                color: white.withOpacity(0.85),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        context.read<SingleCarBloc>().add(
                                              const ZoomInMapEvent(),
                                            );
                                      },
                                      icon: const Icon(
                                        Icons.add_rounded,
                                        size: 24,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 28,
                                      child: ColoredBox(
                                        color: grey,
                                        child: Divider(
                                          height: 1,
                                          thickness: 1,
                                          indent: 12,
                                          endIndent: 12,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        context.read<SingleCarBloc>().add(
                                              const ZoomOutMapEvent(),
                                            );
                                      },
                                      icon: const Icon(
                                        Icons.remove_rounded,
                                        size: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(8),
                              Material(
                                borderRadius: BorderRadius.circular(8),
                                color: white.withOpacity(0.85),
                                child: IconButton(
                                  onPressed: () {
                                    context.read<SingleCarBloc>().add(
                                          const FindMyCurrentLocationEvent(),
                                        );
                                  },
                                  icon: const Image(
                                    image: AssetImage(
                                      'assets/png/person_map.png',
                                    ),
                                    height: 20,
                                    width: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
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
