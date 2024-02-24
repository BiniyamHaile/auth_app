import 'package:authapp/bloc/change_password/change_password_bloc.dart';
import 'package:authapp/screens/change_password/change_password_value_notifiers.dart';
import 'package:authapp/screens/components/button.dart';
import 'package:authapp/screens/components/header_widget.dart';
import 'package:authapp/screens/components/password.dart';
import 'package:authapp/screens/components/email_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final __formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _newPasswordController.addListener(_updateNewPassword);
    super.initState();
  }

  void _updateNewPassword() {
    newPasswordValue.value = _newPasswordController.text;
  }

  void requestChangePassword(BuildContext context) {
    if (__formKey.currentState!.validate()) {
      context.read<ChangePasswordBloc>().add(ChangePasswordUserEvent(
          email: _emailController.text,
          oldPassword: _oldPasswordController.text,
          newPassword: _newPasswordController.text,
          confirmPassword: _confirmPasswordController.text));
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _oldPasswordController.dispose();
    _confirmPasswordController.dispose();
    _newPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const HeaderWidget(
          headerText: "Change Password",
          subHeaderText: "Change your password",
         
        ), 
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
                key: __formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      EmailInputField(emailController: _emailController),
                      SizedBox(height: 20.h),
                      PasswordInputWidget(
                        labelText: 'Old Password',
                        passwordController: _oldPasswordController,
                        valueNotifier: obscureOldPassword,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      PasswordInputWidget(
                        labelText: 'New Password',
                        passwordController: _newPasswordController,
                        valueNotifier: obscureNewPassword,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      PasswordInputWidget(
                          valueNotifier:
                              obscureChangePasswordConfirmPassword,
                          labelText: "Confirm Password",
                          passwordNotifier: newPasswordValue,
                          passwordController: _confirmPasswordController),
                      SizedBox(
                        height: 20.r,
                      ),
                     
                
                
                             BlocListener<ChangePasswordBloc,
                                ChangePasswordState>(
                              listener: (context, state) {
                                if (state is ChangePasswordError) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                      content: Text(state.message),
                                      duration:
                                          const Duration(seconds: 2),
                                    ),
                                  );
                                }else if(state is ChangePasswordSuccess){
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    const SnackBar(
                                      content: Text('Password Changed Successfully'),
                                      duration:
                                          Duration(seconds: 2),
                                    ),
                                  );
                                 
                                }
                              },
                              child:
                                 BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
                  builder: (context, state) {
                                  return  mainAppButton(
                          text: 'Change Password',
                          context: context,
                          loading: state is ChangePasswordLoading ? true : false,
                          onPressed: () {
                            requestChangePassword(context);
                          });
                                },
                              ),
                            )
                         
                    ])),
          ),
        )
      ],
    ));
  }
}
