import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:samrental/assets/colors.dart';
import 'package:samrental/core/extentions/theme.dart';

class NotificationItem extends StatefulWidget {
  final String title;
  final String dateTime;
  final String description;
  const NotificationItem({
    super.key,
    required this.title,
    required this.dateTime,
    required this.description,
  });

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: buttonBackgroundColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: white,
              ),
            ),
            const Gap(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyle.fontSize15FontWeight400,
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: isClicked
                        ? Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(
                              widget.description,
                              maxLines: null,
                              overflow: TextOverflow.ellipsis,
                              style: context.textStyle.fontSize14FontWeight400,
                            ),
                          )
                        : null,
                  ),
                  const Gap(2),
                  Text(
                    widget.dateTime,
                    style: context.textStyle.fontSize13FontWeight400
                        .copyWith(color: const Color(0xFF9A9CA1)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String formatDate(DateTime value) {
  final String day = value.day < 10 ? '0${value.day}' : '${value.day}';
  final String month = value.month < 10 ? '0${value.month}' : '${value.month}';
  return '$day-$month-${value.year}';
}
