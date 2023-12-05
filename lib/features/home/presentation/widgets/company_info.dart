import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../assets/colors.dart';
import '../../../../assets/icons.dart';

class CompanyItem extends StatelessWidget {
  const CompanyItem({
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
              child: Image.asset(AppIcons.logo),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.location),
                  const Gap(4),
                  Text(
                    'Landmark Platan\nrestaurant',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ),
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
                  const Gap(4),
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
