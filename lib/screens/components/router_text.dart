import 'package:authapp/config/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

Widget routerText({
  required String textOne, 
  required String textTwo,
  required String route,
  required BuildContext context

}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      appText(text: textOne , color: Theme.of(context).secondaryHeaderColor),

      Padding(
        padding: EdgeInsets.only(left: 5.w),
        child: GestureDetector(
          onTap: (){
           context.pushNamed(route);
          },
          child: Text(textTwo , style: Theme.of(context).textTheme.displayMedium,)
        ),
      )
    ],
  );
}