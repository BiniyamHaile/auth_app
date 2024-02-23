import 'package:authapp/config/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppColors appColors = AppColors();
ThemeData appTheme = ThemeData(
  // useMaterial3: false,
    primarySwatch: appColors.colorPrimary,
    primaryColor: appColors.colorPrimary,
    disabledColor: appColors.colorSecondaryText,
    scaffoldBackgroundColor: appColors.scaffoldColor,
    secondaryHeaderColor: appColors.colorSecondaryText,
    
    appBarTheme: AppBarTheme(
      backgroundColor: appColors.scaffoldColor,
    ),
    colorScheme: ColorScheme.light(
      primary: appColors.light,
      primaryContainer: appColors.primaryContainer,
      secondary: appColors.outlinedButtonColor,
      error: appColors.errorColor,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
          color: appColors.colorPrimaryText,
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.8.sp),
      displayMedium: TextStyle(
        color: appColors.outlinedButtonColor , 
        fontSize: 15.sp, 
        letterSpacing: 1.5.sp, 
        fontWeight: FontWeight.w700

      ),
      labelSmall: TextStyle(
        color: appColors.greyText,
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all(appColors.colorSecondaryText),
          fixedSize: MaterialStateProperty.all(Size.fromWidth(340.w)),
          backgroundColor:
              MaterialStateProperty.all(appColors.outlinedButtonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(5.r), // Adjust the value as needed
            ),
          ),
          padding:
              MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12.r))),
    ));
