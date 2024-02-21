import 'package:authapp/config/theme/theme.dart';
import 'package:authapp/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, context) {
          return MaterialApp.router(
            title: 'Auth app',
            theme: appTheme,
            routerConfig: appRoutes,
          );
        });
  }
}
