import '_ui_kit.dart';
import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme = ThemeData(
    hintColor: Colors.black45,
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        filled: true,
        contentPadding: EdgeInsets.all(20),
        fillColor: Colors.white,
      ),
      scaffoldBackgroundColor: LightThemeColor.primaryLight,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black45),
        centerTitle: true,
        titleTextStyle: AppTextStyle.h2Style,
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyle.h1Style,
        displayMedium: AppTextStyle.h2Style,
        displaySmall: AppTextStyle.h3Style,
        headlineMedium: AppTextStyle.h4StyleLight,
        headlineSmall: AppTextStyle.h5StyleLight,
        bodyLarge: AppTextStyle.bodyTextLight,
        titleMedium: AppTextStyle.subtitleLight,
      ));

  static ThemeData darkTheme = ThemeData(
    hintColor: Colors.white60,
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      filled: true,
      contentPadding: EdgeInsets.all(20),
      fillColor: DarkThemeColor.primaryLight,
    ),
    scaffoldBackgroundColor: DarkThemeColor.primaryDark,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarTextStyle: const TextStyle(color: Colors.white),
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: AppTextStyle.h2Style,
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyle.h1Style.copyWith(color: Colors.white),
      displayMedium: AppTextStyle.h2Style.copyWith(color: Colors.white),
      displaySmall: AppTextStyle.h3Style.copyWith(color: Colors.white),
      headlineMedium: AppTextStyle.h4StyleLight.copyWith(color: Colors.white),
      headlineSmall: AppTextStyle.h5StyleLight.copyWith(color: Colors.white),
      bodyLarge: AppTextStyle.bodyTextLight.copyWith(color: Colors.white),
      titleMedium: AppTextStyle.subtitleLight.copyWith(color: Colors.white60),
    ),
  );
}
