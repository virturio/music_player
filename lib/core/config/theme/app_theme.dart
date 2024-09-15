import 'package:flutter/material.dart';
import 'package:music_player/core/config/theme/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    fontFamily: 'Satoshi',
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.transparent,
      filled: true,
      hintStyle: const TextStyle(
        color: Color(0xff383838),
        fontWeight: FontWeight.w500,
      ),
      focusColor: AppColors.primary,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: .4,
          )),
      contentPadding: const EdgeInsets.all(30),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.white,
            width: .4,
          )),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.black,
            width: .4,
          )),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      foregroundColor: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
  );

  static final darkTheme = lightTheme.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: lightTheme.appBarTheme.copyWith(
      foregroundColor: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.transparent,
      filled: true,
      hintStyle: const TextStyle(
        color: Color(0xffa7a7a7),
        fontWeight: FontWeight.w500,
      ),
      contentPadding: const EdgeInsets.all(30),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.black,
            width: .4,
          )),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.white,
            width: .4,
          )),
    ),
  );
}
