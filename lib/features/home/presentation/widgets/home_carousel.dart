import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../assets/colors.dart';
import 'carousel_item.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({
    super.key,
  });

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

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
            children: List.generate(4, (index) => const CarouselItem()),
          ),
          Positioned(
            left: 28,
            bottom: 16,
            child: SmoothPageIndicator(
              controller: controller,
              count: 4,
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
