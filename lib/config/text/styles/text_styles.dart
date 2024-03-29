
import 'package:authapp/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Text displayMedium({
  required String text,

}) {
  return Text(text,
      style: TextStyle(
        color: appColors.outlinedButtonColor , 
        fontSize: 15.sp, 
        letterSpacing: 1.5.sp, 
        fontWeight: FontWeight.w700

      )
);
}



TextStyle displaymMedium = TextStyle(
        color: appColors.outlinedButtonColor , 
        fontSize: 15.sp, 
        letterSpacing: 1.5.sp, 
        fontWeight: FontWeight.w700

      );


Text displayLarge({
  required String text,

}) {
  return Text(text,
      style: TextStyle(
          color: appColors.colorPrimaryText,
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.8.sp)
);
}


TextStyle displayyLarge = TextStyle(
          color: appColors.colorPrimaryText,
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.8.sp);



Text labelSmall({
  required String text,

}) {
  return Text(text,
      style: TextStyle(
        color: appColors.greyText,
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
      )
);
}

TextStyle labellSmall = TextStyle(
        color: appColors.greyText,
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
      );