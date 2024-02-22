import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget changePasswordHeaderWidget(BuildContext context) {
  return Container(
    color: Theme.of(context).colorScheme.primaryContainer,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: Padding(
              padding: EdgeInsets.only(top: 30.h, left: 0),
              child: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Text(
            "Change password",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, top: 5.h, bottom: 10.h),
          child: Text(
            "Change your password",
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ],
    ),
  );
}
