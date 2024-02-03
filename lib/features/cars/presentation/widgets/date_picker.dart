import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:samrental/core/extentions/theme.dart';
import 'package:samrental/core/widgets/w_bottomsheet.dart';
import 'package:samrental/core/widgets/w_button.dart';
import 'package:samrental/generated/locale_keys.g.dart';

import '../../../../assets/colors.dart';
import '../../../../assets/icons.dart';

class WDatePicker extends StatefulWidget {
  final DateTime? initialDateTime;
  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final ValueChanged<DateTime> onSavePressed;
  final bool startingDate;
  const WDatePicker({
    required this.onSavePressed,
    required this.startingDate,
    this.initialDateTime,
    this.minimumDate,
    this.maximumDate,
    super.key,
  });

  @override
  State<WDatePicker> createState() => _WDatePickerState();
}

class _WDatePickerState extends State<WDatePicker> {
  DateTime? dateTime;

  @override
  void initState() {
    dateTime = widget.initialDateTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (btshContext) {
            return WBottomSheet(
              height: MediaQuery.of(context).size.height * 0.6,
              isScrollable: true,
              children: [
                Text(
                  LocaleKeys.rent_date.tr(),
                  style: context.textStyle.fontSize18FontWeight700,
                  textAlign: TextAlign.center,
                ),
                const Divider(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: CupertinoDatePicker(
                    onDateTimeChanged: (value) {
                      setState(() {
                        dateTime = value;
                      });
                    },
                    mode: CupertinoDatePickerMode.date,
                    dateOrder: DatePickerDateOrder.dmy,
                    initialDateTime: widget.startingDate
                        ? dateTime
                        : dateTime ?? widget.minimumDate,
                    minimumDate: widget.minimumDate,
                    maximumDate: widget.maximumDate,
                  ),
                ),
                WButton(
                  onTap: () {
                    if (dateTime != null) {
                      widget.onSavePressed(dateTime!);
                    } else {
                      if (widget.startingDate) {
                        widget.onSavePressed(DateTime.now());
                      } else {
                        widget.onSavePressed(
                            widget.minimumDate ?? DateTime.now());
                      }
                    }
                    Navigator.of(btshContext).pop();
                  },
                  text: LocaleKeys.save,
                )
              ],
            );
          },
        );
      },
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: cF8F9FB,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: companyLogoBorderColor,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(AppIcons.calendar),
            const Gap(4),
            Expanded(
              child: Text(
                widget.initialDateTime == null
                    ? widget.startingDate
                        ? LocaleKeys.from.tr()
                        : LocaleKeys.to.tr()
                    : '${widget.initialDateTime!.day}/${widget.initialDateTime!.month}/${widget.initialDateTime!.year}',
                style: context.textStyle.fontSize17FontWeight500,
              ),
            ),
            Transform.rotate(
              angle: 3 * pi / 2,
              child: SvgPicture.asset(
                AppIcons.leftArrow,
                width: 8,
                color: labelColor.withOpacity(.3),
              ),
            )
          ],
        ),
      ),
    );
  }
}
