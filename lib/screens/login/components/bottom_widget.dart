import 'package:authapp/config/text/app_text.dart';
import 'package:authapp/routes/route_names.dart';
import 'package:authapp/screens/components/router_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buttomComponent(BuildContext context){
  return Padding(padding: EdgeInsets.symmetric(vertical: 10.h , horizontal: 20.w),
  child: Column(
    children: [
       
            Row(
                    children: [
                      Expanded(child: Divider(color: Theme.of(context).primaryColor)),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10.w , vertical: 10.h),
                        child: appText(text: "Or login with")
                      ),
                      Expanded(child: Divider(color: Theme.of(context).primaryColor)),
                    ],
                  ),
            SizedBox(height: 10.h,), 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                authButton(text: "Google", logo: "assets/images/google.png" , context: context),
                authButton(text: "Facebook", logo: "assets/images/facebook.png" , context: context),
              ],
            ), 
            Padding(
              padding: EdgeInsets.only(top: 40.h , ) , 
              child: routerText(textOne: "Don't have an account?",
               textTwo: "Register", route: RouteNames.signup, context: context),
            
            ),


    ],
  )
  );
}

Widget authButton({required String text, required String logo , required BuildContext context}){
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 5.w),
    child: ElevatedButton(
      onPressed: (){},
      child: Row(
        children: [
          Image.asset(logo, height: 20.r, width: 20.r,),
          SizedBox(width: 5.w,),
          appText(text: text, color: Theme.of(context).secondaryHeaderColor , fontWeight: FontWeight.bold, fontSize: 17.sp)
        ],
      ),
    ),
  );
}