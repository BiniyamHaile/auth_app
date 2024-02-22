import 'package:authapp/bloc/sign_up/sign_up_bloc.dart';
import 'package:authapp/routes/route_names.dart';
import 'package:authapp/screens/components/button.dart';
import 'package:authapp/screens/components/password.dart';
import 'package:authapp/screens/components/email_input.dart';
import 'package:authapp/screens/components/router_text.dart';
import 'package:authapp/screens/signup/components/first_name_input.dart';
import 'package:authapp/screens/signup/components/header_widget.dart';
import 'package:authapp/screens/signup/components/last_name_input.dart';
import 'package:authapp/screens/signup/sign_up_value_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _passwordController.addListener(_updateNewPassword);
    super.initState();
  }

  void requestSignUp(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<SignUpBloc>().add(SignUpUserEvent(
          email: _emailController.text,
          password: _passwordController.text,
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          confirmPassword: _confirmPasswordController.text));
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();

    super.dispose();
  }

  void _updateNewPassword() {
    passwordValue.value = _passwordController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        signUpHeaderWidget(context),
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
                      EmailInputField(emailController: _emailController),
                      SizedBox(height: 20.h),
                      PasswordInputWidget(
                        labelText: 'Password',
                        passwordController: _passwordController,
                        valueNotifier: obscureSignupPassword,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      PasswordInputWidget(
                          valueNotifier: obscureSignupConfirmPassword,
                          labelText: "Confirm Password",
                          passwordNotifier: passwordValue,
                          passwordController: _confirmPasswordController),
                      SizedBox(
                        height: 20.r,
                      ),
                      BlocListener<SignUpBloc, SignUpState>(
                          listener: (context, state) {
                        if (state is SignUpError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.error,
                              content: Text(state.message),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        } else if (state is SignUpSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Sign up successful'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      }, child: BlocBuilder<SignUpBloc, SignUpState>(
                              builder: (context, state) {
                        return mainAppButton(
                            text: 'Register',
                            context: context,
                            loading: state is SignUpLoading ? true : false,
                            onPressed: () {
                              requestSignUp(context);
                            });
                      })),
                      SizedBox(
                        height: 20.h,
                      ),
                      routerText(
                          textOne: "Have an account?",
                          textTwo: "Sign in",
                          route: RouteNames.login,
                          context: context)
                    ])),
          ),
        )
      ],
    ));
  }
}
