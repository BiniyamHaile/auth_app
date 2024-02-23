import 'package:authapp/config/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget mainAppButton(
    {required String text,
    required BuildContext context,
    required void Function()? onPressed,
    bool loading = false}) {
  return SizedBox(
    height: 50.h,
    width: 340.w,
    child: TextButton(
        style: Theme.of(context).outlinedButtonTheme.style,
        onPressed: onPressed,
        child: loading
            ? const CircularProgressIndicator()
            : appText(
                text: text,
                color: Theme.of(context).secondaryHeaderColor,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp)),
  );
}
