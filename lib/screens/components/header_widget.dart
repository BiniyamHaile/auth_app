import 'package:authapp/config/text/styles/text_styles.dart';
import 'package:authapp/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderWidget extends StatelessWidget {
  final String headerText;
  final String subHeaderText;
  final bool ? useBackButton;
  const HeaderWidget({
    super.key,
    required this.headerText,
    required this.subHeaderText,
    this.useBackButton = true
  });


  @override
  Widget build(BuildContext context) {
    return Container(
    color: Theme.of(context).colorScheme.primaryContainer,
    child: Column(
      children: [
       useBackButton == true?  Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: Padding(
              padding: EdgeInsets.only(top: 30.h, left: 0),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: appColors.light ,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ) : SizedBox(height: 40.h,),
        SizedBox(
          height: 40.h,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 15.w),
            child:  displayLarge(text: headerText),
            
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 15.w, top: 5.h, bottom: 10.h),
            child: labelSmall(text: subHeaderText),
            
          ),
        ),
      ],
    ),
  );
}

  }
