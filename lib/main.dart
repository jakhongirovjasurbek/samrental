import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:samrental/assets/theme.dart';
import 'package:samrental/core/routes/app_routes.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sam Rental',
      theme: AppTheme.darkTheme(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
