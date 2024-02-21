import 'package:authapp/screens/components/button.dart';
import 'package:authapp/screens/components/password.dart';
import 'package:authapp/screens/components/email_input.dart';
import 'package:authapp/screens/signup/components/first_name_input.dart';
import 'package:authapp/screens/signup/components/header_widget.dart';
import 'package:authapp/screens/signup/components/last_name_input.dart';
import 'package:authapp/screens/signup/sign_up_value_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  void changeVisibility(ValueNotifier valueNotifier, bool value) {
    valueNotifier.value = value;
  }

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SignUpHeaderWidget(context), 
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      FirstNameInput(firstNameController: _firstNameController),
                      SizedBox(
                        height: 20.h,
                      ),
                      LastNameInput(lastNameController: _lastNameController),
                      SizedBox(
                        height: 20.h,
                      ),
                     SignupEmailInput(emailController: _emailController),
                      SizedBox(height: 20.h),
                      PasswordInputWidget(labelText: 'Password', passwordController: _passwordController, valueNotifier:obscureSignupPassword ,),
                      // ValueListenableBuilder(
                      //     valueListenable: obscureSignupPassword,
                      //     builder: (BuildContext context, bool value,
                      //         Widget? child) {
                      //       return CustomTextField(
                      //           controller: _passwordController,
                      //           labelText: 'Password',
                      //           hintText: '********',
                      //           obscureText: value,
                      //           keyboardType: TextInputType.visiblePassword,
                      //           suffixIcon: IconButton(
                      //             icon: Icon(
                      //               iconPassword,
                      //               color:
                      //                   Theme.of(context).colorScheme.primary,
                      //             ),
                      //             onPressed: () {
                      //               changeVisibility(
                      //                   obscureSignupPassword, !value);
                      //             },
                      //           ),
                      //           validator: (val) {
                      //             if (val!.isEmpty) {
                      //               return 'Please fill in this field';
                      //             }
                      //             return null;
                      //           });
                      //     }),
                      SizedBox(
                        height: 20.h,
                      ),
                      PasswordInputWidget(valueNotifier:  obscureSignupConfirmPassword, labelText: "Confirm Password", passwordController: _confirmPasswordController),
                      // ValueListenableBuilder(
                          // valueListenable: obscureSignupPassword,
                          // builder: (BuildContext context, bool value,
                          //     Widget? child) {
                          //   return CustomTextField(
                          //       controller: _confirmPasswordController,
                          //       labelText: 'Confirm Password',
                          //       hintText: '********',
                          //       obscureText: value,
                          //       keyboardType: TextInputType.visiblePassword,
                          //       suffixIcon: IconButton(
                          //         icon: Icon(
                          //           iconPassword,
                          //           color:
                          //               Theme.of(context).colorScheme.primary,
                          //         ),
                          //         onPressed: () {
                          //           changeVisibility(
                          //               obscureSignupPassword, !value);
                          //         },
                          //       ),
                          //       validator: (val) {
                          //         if (val!.isEmpty) {
                          //           return 'Please fill in this field';
                          //         }
                          //         return null;
                          //       });
                          // }),
   
                      SizedBox(
                        height: 20.r,
                      ),
                      MainAppButton(
                          text: 'Sign in', context: context, onPressed: () {}) , 

                      Row(
                        children: [

                        ],
                      )
                    ])),
          ),
        )
      ],
    ));
  }
}
