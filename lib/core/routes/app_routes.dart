import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samrental/core/pages/main.dart';
import 'package:samrental/features/cars/presentation/bloc/filter/filter_bloc.dart';
import 'package:samrental/features/cars/presentation/pages/filter.dart';
import 'package:samrental/features/cars/presentation/pages/rental_terms.dart';
import 'package:samrental/features/cars/presentation/pages/reserve.dart';
import 'package:samrental/features/home/presentation/pages/notifications.dart';

sealed class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return fade(const MainPage());
      case '/notifications':
        return fade(const NotificationsPage());
      case '/reserve':
        final carId = settings.arguments as String;
        return fade(ReservePage(id: carId));
      case '/rental_terms':
        return fade(const RentalTermsPage());
      case '/filter':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => FilterBloc(),
            child: const FilterPage(),
          ),
        );
      default:
        return fade(Scaffold(appBar: AppBar()));
    }
  }
}

PageRouteBuilder fade(Widget widget) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 250),
    transitionsBuilder: (_, animation, __, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    pageBuilder: (_, __, ___) => widget,
  );
}
