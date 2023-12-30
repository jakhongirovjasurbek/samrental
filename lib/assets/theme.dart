import 'package:flutter/material.dart';
import 'package:samrental/assets/font_sizes.dart';

import 'colors.dart';

sealed class AppTheme {
  static ThemeData darkTheme() => ThemeData(
        fontFamily: 'SF Pro Display',
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
        ),
        extensions: const [
          FontSizesExtension(
            fontSize10FontWeight400: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: headlineMediumTextColor,
            ),
            fontSize10FontWeight500: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: headlineMediumTextColor,
            ),
            fontSize10FontWeight600: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: headlineMediumTextColor,
            ),
            fontSize10FontWeight700: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: headlineMediumTextColor,
            ),
            fontSize10FontWeight800: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: headlineMediumTextColor,
            ),
            fontSize11FontWeight400: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: headlineMediumTextColor,
            ),
            fontSize11FontWeight500: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: headlineMediumTextColor,
            ),
            fontSize11FontWeight600: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: headlineMediumTextColor,
            ),
            fontSize11FontWeight700: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: headlineMediumTextColor,
            ),
            fontSize11FontWeight800: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              color: headlineMediumTextColor,
            ),
            fontSize13FontWeight400: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: headlineMediumTextColor,
            ),
            fontSize13FontWeight500: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: headlineMediumTextColor,
            ),
            fontSize13FontWeight600: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: headlineMediumTextColor,
            ),
            fontSize13FontWeight700: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: headlineMediumTextColor,
            ),
            fontSize13FontWeight800: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: headlineMediumTextColor,
            ),
            fontSize14FontWeight400: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: headlineMediumTextColor,
            ),
            fontSize14FontWeight500: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: headlineMediumTextColor,
            ),
            fontSize14FontWeight600: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: headlineMediumTextColor,
            ),
            fontSize14FontWeight700: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: headlineMediumTextColor,
            ),
            fontSize14FontWeight800: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: headlineMediumTextColor,
            ),
            fontSize15FontWeight400: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: headlineMediumTextColor,
            ),
            fontSize15FontWeight500: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: headlineMediumTextColor,
            ),
            fontSize15FontWeight600: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: headlineMediumTextColor,
            ),
            fontSize15FontWeight700: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: headlineMediumTextColor,
            ),
            fontSize15FontWeight800: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: headlineMediumTextColor,
            ),
            fontSize16FontWeight400: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: headlineMediumTextColor,
            ),
            fontSize16FontWeight500: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: headlineMediumTextColor,
            ),
            fontSize16FontWeight600: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: headlineMediumTextColor,
            ),
            fontSize16FontWeight700: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: headlineMediumTextColor,
            ),
            fontSize16FontWeight800: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: headlineMediumTextColor,
            ),
            fontSize17FontWeight400: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: headlineMediumTextColor,
            ),
            fontSize17FontWeight500: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: headlineMediumTextColor,
            ),
            fontSize17FontWeight600: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: headlineMediumTextColor,
            ),
            fontSize17FontWeight700: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: headlineMediumTextColor,
            ),
            fontSize17FontWeight800: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: headlineMediumTextColor,
            ),
            fontSize18FontWeight400: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: headlineMediumTextColor,
            ),
            fontSize18FontWeight500: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: headlineMediumTextColor,
            ),
            fontSize18FontWeight600: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: headlineMediumTextColor,
            ),
            fontSize18FontWeight700: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: headlineMediumTextColor,
            ),
            fontSize18FontWeight800: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: headlineMediumTextColor,
            ),
            fontSize20FontWeight400: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: headlineMediumTextColor,
            ),
            fontSize20FontWeight500: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: headlineMediumTextColor,
            ),
            fontSize20FontWeight600: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: headlineMediumTextColor,
            ),
            fontSize20FontWeight700: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: headlineMediumTextColor,
            ),
            fontSize20FontWeight800: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: headlineMediumTextColor,
            ),
            fontSize22FontWeight400: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: headlineMediumTextColor,
            ),
            fontSize22FontWeight500: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: headlineMediumTextColor,
            ),
            fontSize22FontWeight600: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: headlineMediumTextColor,
            ),
            fontSize22FontWeight700: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: headlineMediumTextColor,
            ),
            fontSize22FontWeight800: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: headlineMediumTextColor,
            ),
            fontSize24FontWeight400: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: headlineMediumTextColor,
            ),
            fontSize24FontWeight500: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: headlineMediumTextColor,
            ),
            fontSize24FontWeight600: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: headlineMediumTextColor,
            ),
            fontSize24FontWeight700: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: headlineMediumTextColor,
            ),
            fontSize24FontWeight800: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: headlineMediumTextColor,
            ),
          ),
        ],
      );
}
