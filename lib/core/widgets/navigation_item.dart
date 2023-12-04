import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../assets/colors.dart';

class NavigationItem extends StatefulWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  final PageController controller;
  final int id;
  const NavigationItem({
    required this.icon,
    required this.title,
    required this.onTap,
    required this.id,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  State<NavigationItem> createState() => _NavigationItemState();
}

class _NavigationItemState extends State<NavigationItem> {
  var pageIndex = 0;

  @override
  void initState() {
    widget.controller.addListener(() {
      print("Changed to ${widget.controller.page!}");
      if (pageIndex != widget.controller.page!.toInt()) {
        setState(() {
          pageIndex = widget.controller.page!.toInt();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              widget.icon,
              color: pageIndex == widget.id
                  ? bodySmallTextColor
                  : inactiveNavigationItemTextColor,
              theme: SvgTheme(
                currentColor: pageIndex == widget.id
                    ? bodySmallTextColor
                    : inactiveNavigationItemTextColor,
              ),
            ),
            const Gap(7),
            Text(
              widget.title,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: pageIndex == widget.id
                        ? bodySmallTextColor
                        : inactiveNavigationItemTextColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}