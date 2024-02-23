import 'package:authapp/config/text/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget loginHeaderWidget(BuildContext context) {
  return Container(
    color: Theme.of(context).colorScheme.primaryContainer,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 80.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Text(
            "Sign in to your account",
            style: displayLarge,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, top: 5.h, bottom: 10.h),
          child: Text("Sign in to your account", style: labelSmall),
        ),
      ],
    ),
  );
}
