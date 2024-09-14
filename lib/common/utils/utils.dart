import 'package:flutter/material.dart';

extension ThemeUtils on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
