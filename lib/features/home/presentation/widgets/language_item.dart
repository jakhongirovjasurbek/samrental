import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:samrental/assets/colors.dart';

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
  Widget build(BuildContext context) => InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onPressed,
        splashColor: Colors.transparent,
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: white,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: SizedBox(
            height: 24,
            child: Row(
              children: [
                Image(
                  image: AssetImage(flag),
                  height: 24,
                  width: 36,
                  fit: BoxFit.cover,
                ),
                const Gap(16),
                Text(
                  lang,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
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
        ),
      );
}
