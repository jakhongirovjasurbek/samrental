import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:samrental/assets/colors.dart';
import 'package:samrental/assets/icons.dart';
import 'package:samrental/core/extentions/theme.dart';
import 'package:samrental/core/widgets/w_scale.dart';
import 'package:samrental/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:samrental/features/home/presentation/bloc/notifications/notification_bloc.dart';
import 'package:samrental/generated/locale_keys.g.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: white,
          appBar: AppBar(
            elevation: 1,
            backgroundColor: white,
            shadowColor: black.withOpacity(.5),
            automaticallyImplyLeading: false,
            titleSpacing: 16,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WScale(
                  onTap: () => Navigator.of(context).pop(),
                  child: SvgPicture.asset(AppIcons.iosArrowLeft, color: black),
                ),
                Text(
                  LocaleKeys.notifications.tr(),
                  style: context.textStyle.fontSize17FontWeight600,
                ),
                const SizedBox(width: 24),
                // WScale(
                //   onTap: () {},
                //   child: Text(
                //     LocaleKeys.read_all.tr(),
                //     style: context.textStyle.fontSize17FontWeight400.copyWith(
                //       color: buttonBackgroundColor,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          body: BlocBuilder<NotificationBloc, NotificationState>(
            builder: (context, state) {
              if (state.status == LoadingStatus.pure) {
                context.read<NotificationBloc>().add(GetAllNotifications());
                return const SizedBox();
              } else if (state.status == LoadingStatus.loading) {
                return const Center(child: CupertinoActivityIndicator());
              } else if (state.status == LoadingStatus.loadedWithSuccess) {
                return ListView.separated(
                  itemBuilder: (_, index) => NotificationItem(
                    title: state.notifications[index].title,
                    dateTime: formatDate(
                      DateTime.fromMillisecondsSinceEpoch(
                        state.notifications[index].createdAt,
                      ),
                    ),
                    description: state.notifications[index].body,
                  ),
                  separatorBuilder: (_, __) => Container(
                    height: 1,
                    width: double.maxFinite,
                    color: const Color(0XFFEDECF2),
                  ),
                  itemCount: state.notifications.length,
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        );
      }),
    );
  }
}

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
