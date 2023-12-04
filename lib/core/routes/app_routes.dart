import 'package:flutter/material.dart';
import 'package:samrental/core/pages/main.dart';

sealed class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return PageRouteBuilder(
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          pageBuilder: (_, __, ___) => const MainPage(),
        );

      default:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const Scaffold(),
        );
    }
  }
}
