import 'package:flutter/material.dart';

import '../../../../assets/icons.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 288,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF131229),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 16,
            left: 16,
            child: Text(
              'You can give a car\nfor rent with efficient\noptimization',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(AppIcons.audi),
          ),
        ],
      ),
    );
  }
}
