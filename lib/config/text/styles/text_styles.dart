
import 'package:authapp/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle displayMedium = TextStyle(
        color: appColors.outlinedButtonColor , 
        fontSize: 15.sp, 
        letterSpacing: 1.5.sp, 
        fontWeight: FontWeight.w700

      );

TextStyle displayLarge = TextStyle(
          color: appColors.colorPrimaryText,
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.8.sp);
TextStyle labelSmall = TextStyle(
        color: appColors.greyText,
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
      );