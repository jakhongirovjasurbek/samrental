import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:samrental/assets/colors.dart';
import 'package:samrental/features/home/presentation/widgets/company_info.dart';

import '../../../../assets/icons.dart';
import '../../../../core/widgets/w_scale.dart';

class OwnerPage extends StatelessWidget {
  const OwnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Row(
          children: [
            WScale(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: SvgPicture.asset(
                  AppIcons.iosArrowLeft,
                  color: black,
                ),
              ),
            ),
            const Gap(16),

          ],
        ),
      ),
      body: const Column(
        children: [
          Gap(20),
           CompanyItem(
            isOwnerNameIncluded: true,
          ),
        ],
      ),
    );
  }
}
