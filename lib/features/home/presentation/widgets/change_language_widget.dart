import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:samrental/core/widgets/w_bottomsheet.dart';
import 'package:samrental/features/home/presentation/widgets/language_item.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return WBottomSheet(
      children: [
        SelectLangButton(
          isSelected: context.locale == const Locale('ru'),
          onPressed: () {
            context.setLocale(const Locale('ru'));
            Navigator.pop(context);
          },
          flag: 'assets/png/flag_ru.png',
          lang: 'Русский',
        ),
        // const Gap(16),
        SelectLangButton(
          onPressed: () {
            context.setLocale(const Locale('en'));
            Navigator.pop(context);
          },
          isSelected: context.locale == const Locale('en'),
          flag: 'assets/png/flag_en.png',
          lang: 'English',
        ),
        // const Gap(16),
        SelectLangButton(
          onPressed: () {
            context.setLocale(const Locale('uz'));
            Navigator.pop(context);
          },
          isSelected: context.locale == const Locale('uz'),
          flag: 'assets/png/flag_uz.png',
          lang: 'O’zbek',
        ),
        const Gap(32),
      ],
    );
  }
}
