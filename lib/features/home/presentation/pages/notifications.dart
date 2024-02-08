import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samrental/assets/colors.dart';
import 'package:samrental/assets/icons.dart';
import 'package:samrental/core/extentions/theme.dart';
import 'package:samrental/core/widgets/w_scale.dart';
import 'package:samrental/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:samrental/features/home/presentation/bloc/notifications/notification_bloc.dart';
import 'package:samrental/generated/locale_keys.g.dart';

import '../widgets/notification_item.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    context.read<NotificationBloc>().add(GetAllNotifications());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
  }
}
