import 'package:flutter/material.dart';

import 'colors.dart';

sealed class AppTheme {
  static ThemeData darkTheme() => ThemeData(
        fontFamily: 'SF Pro Display',
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: headlineMediumTextColor,
          ),
          bodyMedium: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: white,
          ),
          bodySmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: bodySmallTextColor,
          ),
        ),
      );
}
