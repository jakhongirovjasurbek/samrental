import 'package:flutter/material.dart';

import 'colors.dart';

sealed class AppTheme {
  static ThemeData darkTheme() => ThemeData(
        fontFamily: 'SF Pro Display',
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: white,
          ),
          headlineMedium: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: headlineMediumTextColor,
          ),
          bodyLarge: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: headlineMediumTextColor,
          ),
          bodyMedium: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: white,
          ),
          bodySmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: bodySmallTextColor,
          ),
          labelLarge: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: buttonBackgroundColor,
          ),
          labelMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: white,
          ),
          titleLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: headlineMediumTextColor,
          ),
        ),
      );
}
