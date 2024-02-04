import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:samrental/core/extentions/theme.dart';
import 'package:samrental/features/home/presentation/widgets/app_bar_action_item.dart';
import 'package:samrental/features/home/presentation/widgets/change_language_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../assets/colors.dart';
import '../../../../assets/icons.dart';
import '../../../../generated/locale_keys.g.dart';

class AppBarContent extends StatelessWidget {
  final Color? actionItemBackgroundColor;

  const AppBarContent({
    this.actionItemBackgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Gap(16),
        Text(
          LocaleKeys.sam_rental.tr(),
          style: context.textStyle.fontSize22FontWeight700,
        ),
        const Spacer(),
        AppBarActionItem(
          backgroundColor: actionItemBackgroundColor,
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (sheetContext) {
                return CupertinoActionSheet(
                  actions: [
                    CupertinoActionSheetAction(
                      onPressed: () async {
                        try {
                          await launchUrl(
                            Uri(scheme: 'tel', path: '+998902715545'),
                          );
                        } on PlatformException catch (exception) {
                          print(exception);
                        }
                      },
                      child: Text(
                        '+998 (90) 271 55 45',
                        style:
                            context.textStyle.fontSize17FontWeight600.copyWith(
                          color: systemBlue,
                        ),
                      ),
                    ),
                  ],
                  cancelButton: CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.of(sheetContext).pop();
                    },
                    child: Text(
                      LocaleKeys.cancel.tr(),
                      style: context.textStyle.fontSize17FontWeight600.copyWith(
                        color: systemBlue,
                      ),
                    ),
                  ),
                );
              },
            );
          },
          icon: AppIcons.phone,
        ),
        const Gap(12),
        AppBarActionItem(
          backgroundColor: actionItemBackgroundColor,
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (btshContext) {
                return const LanguageBottomSheet();
              },
            );
          },
          icon: AppIcons.language,
        ),
        const Gap(12),
        AppBarActionItem(
          backgroundColor: actionItemBackgroundColor,
          onTap: () {
            Navigator.of(context).pushNamed('/notifications');
          },
          icon: AppIcons.notification,
        ),
        const Gap(7),
      ],
    );
  }
}
