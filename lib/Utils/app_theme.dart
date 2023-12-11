import 'package:flutter/material.dart';


import 'app_colors.dart';


ThemeData currentTheme(context) => Theme.of(context);

TextStyle? titleLarge(context) => currentTheme(context).textTheme.titleLarge;

TextStyle? titleMedium(context) => currentTheme(context).textTheme.titleMedium;

TextStyle? titleSmall(context) => currentTheme(context).textTheme.titleSmall;

Color primaryColor(context) => currentTheme(context).primaryColor;

// Color secondaryColor(context) => getColorScheme(context).secondary;

Color accentColor() => const Color(0xff2A364E);

Color grayColor() => const Color(0xffB9B9B9);

class AppTheme {
  static const pinkColor = Color(0xffE13D56);

  static const grayColor = Color(0xff808080);

  static ThemeData themeData = ThemeData(
    fontFamily: "Poppins",
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    focusColor: Colors.transparent,
    hoverColor: Colors.transparent,
    primaryColor: AppTheme.pinkColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      actionsIconTheme: IconThemeData(
        color: Colors.black,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedLabelStyle: TextStyle(color: AppTheme.pinkColor),
        unselectedLabelStyle: TextStyle(
          color: AppColors.whiteColor.withOpacity(0.5),
        ),
        unselectedItemColor: AppColors.whiteColor.withOpacity(0.5),
        selectedItemColor: AppTheme.pinkColor,
        showSelectedLabels: true,
        showUnselectedLabels: true),
    textTheme: TextTheme(
      titleLarge: TextStyle(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
          fontStyle: FontStyle.normal,
          fontSize: 12,
          overflow: TextOverflow.ellipsis),
      titleMedium: TextStyle(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
          fontSize: 14,
          fontStyle: FontStyle.normal,
          overflow: TextOverflow.ellipsis),
      titleSmall: TextStyle(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w300,
          fontFamily: 'Poppins',
          fontStyle: FontStyle.normal,
          fontSize: 12,
          overflow: TextOverflow.ellipsis),
    ),
    // bottomAppBarTheme: const BottomAppBarTheme(
    //   color: AppColors.whiteColor,
    // ),

    ///  colorScheme: ColorScheme(background: whiteColor, brightness: null, primary: null),
  );

  static var green = const Color(0xff43B43F);

  static var yellow = const Color(0xffFE9D2B);
}

var buttonTextStyle = TextStyle(
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    fontStyle: FontStyle.normal,
    fontSize: 12,
    overflow: TextOverflow.ellipsis);

var stylebold70010 = TextStyle(
    color: AppColors.blackColor,
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins',
    fontStyle: FontStyle.normal,
    fontSize: 10,
    height: 1,
    overflow: TextOverflow.ellipsis);

var styleRegular50012 = TextStyle(
    color: AppColors.blackColor,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    fontStyle: FontStyle.normal,
    fontSize: 12,
    overflow: TextOverflow.ellipsis);

var styleMedium50012 = TextStyle(
    color: AppColors.blackColor,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    fontStyle: FontStyle.normal,
    fontSize: 12,
    overflow: TextOverflow.ellipsis);
