import 'package:flutter/material.dart';
import 'package:samrental/generated/locale_keys.g.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../assets/colors.dart';
import '../../../../assets/icons.dart';
import 'carousel_item.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({
    super.key,
  });

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

List<CarouselItemEntity> list = const [
  CarouselItemEntity(
    text: LocaleKeys.slide_one_description,
    image: AppIcons.audi,
    color: Color(0xFF131229),
    textColor: Color(0xFFFFFFFF),
  ),
  CarouselItemEntity(
    text: LocaleKeys.slide_two_description,
    image: AppIcons.iphone,
    color: Color(0xFFF96C1E),
    textColor: Color(0xFFFFFFFF),
  ),
  CarouselItemEntity(
    text: LocaleKeys.slide_three_description,
    image: AppIcons.hyundai,
    color: Color(0xFFFFFFFF),
    textColor: Color(0xFF000000),
  ),
];

class _HomeCarouselState extends State<HomeCarousel> {
  late PageController controller;

  @override
  void initState() {
    controller = PageController(
      viewportFraction: 0.95,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 288,
      width: double.maxFinite,
      child: Stack(
        children: [
          PageView(
            controller: controller,
            children: List.generate(
              list.length,
                  (index) =>
                  CarouselItem(
                    item: list[index],
                  ),
            ),
          ),
          Positioned(
            left: 28,
            bottom: 16,
            child: SmoothPageIndicator(
              controller: controller,
              count: list.length,
              effect: WormEffect(
                activeDotColor: white,
                dotHeight: 3,
                dotWidth: 27,
                dotColor: white.withOpacity(.4),
                radius: 8,
                spacing: 7,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CarouselItemEntity {
  final String text;
  final String image;
  final Color color;
  final Color textColor;

  const CarouselItemEntity({
    required this.text,
    required this.image,
    required this.color,
    required this.textColor,
  });
}
