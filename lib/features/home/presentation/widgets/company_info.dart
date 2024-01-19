import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../assets/colors.dart';
import '../../../../assets/icons.dart';

class CompanyItem extends StatelessWidget {
  final bool isOwnerNameIncluded;

  const CompanyItem({
    this.isOwnerNameIncluded = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: white,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: companyLogoBorderColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Container(
              height: 80,
              padding: const EdgeInsets.all(20),
              width: double.maxFinite,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: logoBackground,
                border: Border.all(
                  width: 1,
                  color: companyLogoBorderColor,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(AppIcons.logo2),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.location),
                  const Gap(8),
                  Text(
                    'Landmark Platan restaurant',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ),
            if (isOwnerNameIncluded) ...{
              Container(
                height: 1,
                width: double.maxFinite,
                margin: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: companyLogoBorderColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    // SvgPicture.asset(AppIcons.phoneSmall),
                    const Gap(8),
                    Text(
                      'Sultonov Zafar',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
              ),
            },
            Container(
              height: 1,
              width: double.maxFinite,
              margin: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: companyLogoBorderColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.phoneSmall),
                  const Gap(8),
                  Text(
                    '+998 (90) 271 55 45',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
