import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:samrental/assets/colors.dart';
import 'package:samrental/core/extentions/theme.dart';
import 'package:samrental/core/widgets/w_scale.dart';

class SelectLangButton extends StatelessWidget {
  const SelectLangButton({
    super.key,
    required this.onPressed,
    required this.flag,
    required this.lang,
    this.isSelected = false,
  });

  final void Function() onPressed;
  final String flag;
  final String lang;
  final bool isSelected;

  @override
  Widget build(BuildContext context) => WScale(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: white,
          ),
          padding: const EdgeInsets.symmetric(
            // horizontal: 16,
            vertical: 12,
          ),
          child: Row(
            children: [
              Image(
                image: AssetImage(flag),
                height: 24,
                width: 36,
                fit: BoxFit.cover,
              ),
              const Gap(16),
              Text(lang, style: context.textStyle.fontSize16FontWeight500),
              const Spacer(),
              if (isSelected)
                const Icon(
                  Icons.check,
                  size: 24,
                  color: buttonBackgroundColor,
                )
            ],
          ),
        ),
      );
}
