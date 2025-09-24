import 'package:flutter/material.dart';

import 'default_text_theme.dart';
import 'text_theme_factory.dart';

class AppTheme {
  final TextThemeFactory factory;

  AppTheme._(this.factory);

  factory AppTheme.create() {
    return AppTheme._(DefaultTextTheme());
  }

  ThemeData build() {
    return ThemeData(
      textTheme: factory.create(),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.green,
        selectionColor: Colors.green.withValues(alpha: 0.4),
        selectionHandleColor: Colors.green,
      ),
    );
  }
}
