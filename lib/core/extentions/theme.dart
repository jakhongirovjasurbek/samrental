import 'package:flutter/material.dart';
import 'package:samrental/assets/font_sizes.dart';

extension Fonts on BuildContext {
  FontSizesExtension get textStyle =>
      Theme.of(this).extension<FontSizesExtension>()!;
}
