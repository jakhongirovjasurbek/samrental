import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../assets/colors.dart';

class WShimmer extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  const WShimmer({
    this.borderRadius = 6,
    this.width = 25,
    this.height = 25,
    this.margin,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Shimmer.fromColors(
        baseColor: const Color(0XFFE1E1E1),
        highlightColor: grey.withOpacity(0.5),
        child: Container(
          padding: padding,
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
