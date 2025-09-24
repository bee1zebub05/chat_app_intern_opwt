import 'package:flutter/material.dart';

import '../theme/app_theme_wrapper.dart';
import '../theme/text_theme_factory.dart';

extension BuildContextX on BuildContext {
  TextThemeFactory get textTheme {
    return AppThemeInheritWidget.of(this).factory;
  }
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}
