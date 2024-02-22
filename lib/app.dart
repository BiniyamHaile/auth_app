import 'package:authapp/bloc/change_password/change_password_bloc.dart';
import 'package:authapp/bloc/login/login_bloc.dart';
import 'package:authapp/bloc/sign_up/sign_up_bloc.dart';
import 'package:authapp/config/theme/theme.dart';
import 'package:authapp/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          return MultiBlocProvider(
              providers: [
                BlocProvider<SignUpBloc>(
                  create: (context) => SignUpBloc(),
                ),
                BlocProvider<LoginBloc>(
                  create: (context) => LoginBloc(),
                ),
                BlocProvider<ChangePasswordBloc>(
                  create: (context) => ChangePasswordBloc(),
                ),
              ],
              child: MaterialApp.router(
                
                title: 'Auth app',
                theme: appTheme,
                routerConfig: appRoutes,
                debugShowCheckedModeBanner: false,
              ));
        });
  }
}
