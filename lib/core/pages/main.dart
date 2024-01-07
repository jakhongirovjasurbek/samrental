import 'package:flutter/material.dart';
import 'package:samrental/assets/colors.dart';
import 'package:samrental/assets/icons.dart';
import 'package:samrental/features/cars/presentation/cars_screen.dart';
import 'package:samrental/features/home/data/repositories/home_repository.dart';
import 'package:samrental/features/home/presentation/home_screen.dart';

import '../../features/home/data/data_source/network_data_source.dart';
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
  void didChangeDependencies() async {
    final repository = HomeRepositoryImpl(dataSource: HomeNetworkDataSource());

    await repository.getCars();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.page == 1) {
          controller.previousPage(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
          );
          return false;
        }
        return true;
      },
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 62 + MediaQuery.of(context).padding.bottom,
          width: double.maxFinite,
          padding:  EdgeInsets.fromLTRB(8,8,8,8 + MediaQuery.of(context).padding.bottom),
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
          allowImplicitScrolling: true,
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            HomeScreen(pageController: controller),
            const CarsScreen(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
