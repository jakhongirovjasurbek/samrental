import 'package:flutter/material.dart';
import 'package:samrental/assets/colors.dart';
import 'package:samrental/assets/icons.dart';

import '../widgets/navigation_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PageController controller;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 62,
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
        decoration: BoxDecoration(
          color: white,
          border: const Border(
            top: BorderSide(color: grey, width: .5),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -.33),
              color: black.withOpacity(.18),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: NavigationItem(
                controller: controller,
                onTap: () {
                  controller.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                  );
                },
                icon: AppIcons.home,
                title: 'Home',
                id: 0,
              ),
            ),
            Expanded(
              child: NavigationItem(
                controller: controller,
                onTap: () {
                  controller.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                  );
                },
                icon: AppIcons.cars,
                id: 1,
                title: 'Cars',
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: controller,
        children: const [
          SizedBox(),
          SizedBox(),
        ],
      ),
    );
  }
}
