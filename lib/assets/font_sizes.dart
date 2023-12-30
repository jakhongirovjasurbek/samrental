import 'package:flutter/material.dart';

class FontSizesExtension extends ThemeExtension<FontSizesExtension> {
  final TextStyle fontSize10FontWeight400;
  final TextStyle fontSize10FontWeight500;
  final TextStyle fontSize10FontWeight600;
  final TextStyle fontSize10FontWeight700;
  final TextStyle fontSize10FontWeight800;
  final TextStyle fontSize11FontWeight400;
  final TextStyle fontSize11FontWeight500;
  final TextStyle fontSize11FontWeight600;
  final TextStyle fontSize11FontWeight700;
  final TextStyle fontSize11FontWeight800;
  final TextStyle fontSize13FontWeight400;
  final TextStyle fontSize13FontWeight500;
  final TextStyle fontSize13FontWeight600;
  final TextStyle fontSize13FontWeight700;
  final TextStyle fontSize13FontWeight800;
  final TextStyle fontSize14FontWeight400;
  final TextStyle fontSize14FontWeight500;
  final TextStyle fontSize14FontWeight600;
  final TextStyle fontSize14FontWeight700;
  final TextStyle fontSize14FontWeight800;
  final TextStyle fontSize15FontWeight400;
  final TextStyle fontSize15FontWeight500;
  final TextStyle fontSize15FontWeight600;
  final TextStyle fontSize15FontWeight700;
  final TextStyle fontSize15FontWeight800;
  final TextStyle fontSize16FontWeight400;
  final TextStyle fontSize16FontWeight500;
  final TextStyle fontSize16FontWeight600;
  final TextStyle fontSize16FontWeight700;
  final TextStyle fontSize16FontWeight800;
  final TextStyle fontSize17FontWeight400;
  final TextStyle fontSize17FontWeight500;
  final TextStyle fontSize17FontWeight600;
  final TextStyle fontSize17FontWeight700;
  final TextStyle fontSize17FontWeight800;
  final TextStyle fontSize18FontWeight400;
  final TextStyle fontSize18FontWeight500;
  final TextStyle fontSize18FontWeight600;
  final TextStyle fontSize18FontWeight700;
  final TextStyle fontSize18FontWeight800;
  final TextStyle fontSize20FontWeight400;
  final TextStyle fontSize20FontWeight500;
  final TextStyle fontSize20FontWeight600;
  final TextStyle fontSize20FontWeight700;
  final TextStyle fontSize20FontWeight800;
  final TextStyle fontSize22FontWeight400;
  final TextStyle fontSize22FontWeight500;
  final TextStyle fontSize22FontWeight600;
  final TextStyle fontSize22FontWeight700;
  final TextStyle fontSize22FontWeight800;
  final TextStyle fontSize24FontWeight400;
  final TextStyle fontSize24FontWeight500;
  final TextStyle fontSize24FontWeight600;
  final TextStyle fontSize24FontWeight700;
  final TextStyle fontSize24FontWeight800;

  const FontSizesExtension({
    required this.fontSize10FontWeight400,
    required this.fontSize10FontWeight500,
    required this.fontSize10FontWeight600,
    required this.fontSize10FontWeight700,
    required this.fontSize10FontWeight800,
    required this.fontSize11FontWeight400,
    required this.fontSize11FontWeight500,
    required this.fontSize11FontWeight600,
    required this.fontSize11FontWeight700,
    required this.fontSize11FontWeight800,
    required this.fontSize13FontWeight400,
    required this.fontSize13FontWeight500,
    required this.fontSize13FontWeight600,
    required this.fontSize13FontWeight700,
    required this.fontSize13FontWeight800,
    required this.fontSize14FontWeight400,
    required this.fontSize14FontWeight500,
    required this.fontSize14FontWeight600,
    required this.fontSize14FontWeight700,
    required this.fontSize14FontWeight800,
    required this.fontSize15FontWeight400,
    required this.fontSize15FontWeight500,
    required this.fontSize15FontWeight600,
    required this.fontSize15FontWeight700,
    required this.fontSize15FontWeight800,
    required this.fontSize16FontWeight400,
    required this.fontSize16FontWeight500,
    required this.fontSize16FontWeight600,
    required this.fontSize16FontWeight700,
    required this.fontSize16FontWeight800,
    required this.fontSize17FontWeight400,
    required this.fontSize17FontWeight500,
    required this.fontSize17FontWeight600,
    required this.fontSize17FontWeight700,
    required this.fontSize17FontWeight800,
    required this.fontSize18FontWeight400,
    required this.fontSize18FontWeight500,
    required this.fontSize18FontWeight600,
    required this.fontSize18FontWeight700,
    required this.fontSize18FontWeight800,
    required this.fontSize20FontWeight400,
    required this.fontSize20FontWeight500,
    required this.fontSize20FontWeight600,
    required this.fontSize20FontWeight700,
    required this.fontSize20FontWeight800,
    required this.fontSize22FontWeight400,
    required this.fontSize22FontWeight500,
    required this.fontSize22FontWeight600,
    required this.fontSize22FontWeight700,
    required this.fontSize22FontWeight800,
    required this.fontSize24FontWeight400,
    required this.fontSize24FontWeight500,
    required this.fontSize24FontWeight600,
    required this.fontSize24FontWeight700,
    required this.fontSize24FontWeight800,
  });

  @override
  ThemeExtension<FontSizesExtension> lerp(
      covariant ThemeExtension<FontSizesExtension>? other, double t) {
    if (other is! FontSizesExtension) {
      return this;
    } else {
      return copyWith();
    }
  }

  @override
  FontSizesExtension copyWith({
    TextStyle? fontSize10FontWeight400,
    TextStyle? fontSize10FontWeight500,
    TextStyle? fontSize10FontWeight600,
    TextStyle? fontSize10FontWeight700,
    TextStyle? fontSize10FontWeight800,
    TextStyle? fontSize11FontWeight400,
    TextStyle? fontSize11FontWeight500,
    TextStyle? fontSize11FontWeight600,
    TextStyle? fontSize11FontWeight700,
    TextStyle? fontSize11FontWeight800,
    TextStyle? fontSize13FontWeight400,
    TextStyle? fontSize13FontWeight500,
    TextStyle? fontSize13FontWeight600,
    TextStyle? fontSize13FontWeight700,
    TextStyle? fontSize13FontWeight800,
    TextStyle? fontSize14FontWeight400,
    TextStyle? fontSize14FontWeight500,
    TextStyle? fontSize14FontWeight600,
    TextStyle? fontSize14FontWeight700,
    TextStyle? fontSize14FontWeight800,
    TextStyle? fontSize15FontWeight400,
    TextStyle? fontSize15FontWeight500,
    TextStyle? fontSize15FontWeight600,
    TextStyle? fontSize15FontWeight700,
    TextStyle? fontSize15FontWeight800,
    TextStyle? fontSize16FontWeight400,
    TextStyle? fontSize16FontWeight500,
    TextStyle? fontSize16FontWeight600,
    TextStyle? fontSize16FontWeight700,
    TextStyle? fontSize16FontWeight800,
    TextStyle? fontSize17FontWeight400,
    TextStyle? fontSize17FontWeight500,
    TextStyle? fontSize17FontWeight600,
    TextStyle? fontSize17FontWeight700,
    TextStyle? fontSize17FontWeight800,
    TextStyle? fontSize18FontWeight400,
    TextStyle? fontSize18FontWeight500,
    TextStyle? fontSize18FontWeight600,
    TextStyle? fontSize18FontWeight700,
    TextStyle? fontSize18FontWeight800,
    TextStyle? fontSize20FontWeight400,
    TextStyle? fontSize20FontWeight500,
    TextStyle? fontSize20FontWeight600,
    TextStyle? fontSize20FontWeight700,
    TextStyle? fontSize20FontWeight800,
    TextStyle? fontSize22FontWeight400,
    TextStyle? fontSize22FontWeight500,
    TextStyle? fontSize22FontWeight600,
    TextStyle? fontSize22FontWeight700,
    TextStyle? fontSize22FontWeight800,
    TextStyle? fontSize24FontWeight400,
    TextStyle? fontSize24FontWeight500,
    TextStyle? fontSize24FontWeight600,
    TextStyle? fontSize24FontWeight700,
    TextStyle? fontSize24FontWeight800,
  }) {
    return FontSizesExtension(
      fontSize10FontWeight400: fontSize10FontWeight400 ?? this.fontSize10FontWeight400,
      fontSize10FontWeight500: fontSize10FontWeight500 ?? this.fontSize10FontWeight500,
      fontSize10FontWeight600: fontSize10FontWeight600 ?? this.fontSize10FontWeight600,
      fontSize10FontWeight700: fontSize10FontWeight700 ?? this.fontSize10FontWeight700,
      fontSize10FontWeight800: fontSize10FontWeight800 ?? this.fontSize10FontWeight800,
      fontSize11FontWeight400: fontSize11FontWeight400 ?? this.fontSize11FontWeight400,
      fontSize11FontWeight500: fontSize11FontWeight500 ?? this.fontSize11FontWeight500,
      fontSize11FontWeight600: fontSize11FontWeight600 ?? this.fontSize11FontWeight600,
      fontSize11FontWeight700: fontSize11FontWeight700 ?? this.fontSize11FontWeight700,
      fontSize11FontWeight800: fontSize11FontWeight800 ?? this.fontSize11FontWeight800,
      fontSize13FontWeight400: fontSize13FontWeight400 ?? this.fontSize13FontWeight400,
      fontSize13FontWeight500: fontSize13FontWeight500 ?? this.fontSize13FontWeight500,
      fontSize13FontWeight600: fontSize13FontWeight600 ?? this.fontSize13FontWeight600,
      fontSize13FontWeight700: fontSize13FontWeight700 ?? this.fontSize13FontWeight700,
      fontSize13FontWeight800: fontSize13FontWeight800 ?? this.fontSize13FontWeight800,
      fontSize14FontWeight400: fontSize14FontWeight400 ?? this.fontSize14FontWeight400,
      fontSize14FontWeight500: fontSize14FontWeight500 ?? this.fontSize14FontWeight500,
      fontSize14FontWeight600: fontSize14FontWeight600 ?? this.fontSize14FontWeight600,
      fontSize14FontWeight700: fontSize14FontWeight700 ?? this.fontSize14FontWeight700,
      fontSize14FontWeight800: fontSize14FontWeight800 ?? this.fontSize14FontWeight800,
      fontSize15FontWeight400: fontSize15FontWeight400 ?? this.fontSize15FontWeight400,
      fontSize15FontWeight500: fontSize15FontWeight500 ?? this.fontSize15FontWeight500,
      fontSize15FontWeight600: fontSize15FontWeight600 ?? this.fontSize15FontWeight600,
      fontSize15FontWeight700: fontSize15FontWeight700 ?? this.fontSize15FontWeight700,
      fontSize15FontWeight800: fontSize15FontWeight800 ?? this.fontSize15FontWeight800,
      fontSize16FontWeight400: fontSize16FontWeight400 ?? this.fontSize16FontWeight400,
      fontSize16FontWeight500: fontSize16FontWeight500 ?? this.fontSize16FontWeight500,
      fontSize16FontWeight600: fontSize16FontWeight600 ?? this.fontSize16FontWeight600,
      fontSize16FontWeight700: fontSize16FontWeight700 ?? this.fontSize16FontWeight700,
      fontSize16FontWeight800: fontSize16FontWeight800 ?? this.fontSize16FontWeight800,
      fontSize17FontWeight400: fontSize17FontWeight400 ?? this.fontSize17FontWeight400,
      fontSize17FontWeight500: fontSize17FontWeight500 ?? this.fontSize17FontWeight500,
      fontSize17FontWeight600: fontSize17FontWeight600 ?? this.fontSize17FontWeight600,
      fontSize17FontWeight700: fontSize17FontWeight700 ?? this.fontSize17FontWeight700,
      fontSize17FontWeight800: fontSize17FontWeight800 ?? this.fontSize17FontWeight800,
      fontSize18FontWeight400: fontSize18FontWeight400 ?? this.fontSize18FontWeight400,
      fontSize18FontWeight500: fontSize18FontWeight500 ?? this.fontSize18FontWeight500,
      fontSize18FontWeight600: fontSize18FontWeight600 ?? this.fontSize18FontWeight600,
      fontSize18FontWeight700: fontSize18FontWeight700 ?? this.fontSize18FontWeight700,
      fontSize18FontWeight800: fontSize18FontWeight800 ?? this.fontSize18FontWeight800,
      fontSize20FontWeight400: fontSize20FontWeight400 ?? this.fontSize20FontWeight400,
      fontSize20FontWeight500: fontSize20FontWeight500 ?? this.fontSize20FontWeight500,
      fontSize20FontWeight600: fontSize20FontWeight600 ?? this.fontSize20FontWeight600,
      fontSize20FontWeight700: fontSize20FontWeight700 ?? this.fontSize20FontWeight700,
      fontSize20FontWeight800: fontSize20FontWeight800 ?? this.fontSize20FontWeight800,
      fontSize22FontWeight400: fontSize22FontWeight400 ?? this.fontSize22FontWeight400,
      fontSize22FontWeight500: fontSize22FontWeight500 ?? this.fontSize22FontWeight500,
      fontSize22FontWeight600: fontSize22FontWeight600 ?? this.fontSize22FontWeight600,
      fontSize22FontWeight700: fontSize22FontWeight700 ?? this.fontSize22FontWeight700,
      fontSize22FontWeight800: fontSize22FontWeight800 ?? this.fontSize22FontWeight800,
      fontSize24FontWeight400: fontSize24FontWeight400 ?? this.fontSize24FontWeight400,
      fontSize24FontWeight500: fontSize24FontWeight500 ?? this.fontSize24FontWeight500,
      fontSize24FontWeight600: fontSize24FontWeight600 ?? this.fontSize24FontWeight600,
      fontSize24FontWeight700: fontSize24FontWeight700 ?? this.fontSize24FontWeight700,
      fontSize24FontWeight800: fontSize24FontWeight800 ?? this.fontSize24FontWeight800,
    );
  }
}
