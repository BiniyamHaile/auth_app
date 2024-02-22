import 'package:authapp/bloc/login/login_bloc.dart';
import 'package:authapp/routes/route_names.dart';
import 'package:authapp/screens/components/button.dart';
import 'package:authapp/screens/components/email_input.dart';
import 'package:authapp/screens/components/password.dart';
import 'package:authapp/screens/login/components/bottom_widget.dart';
import 'package:authapp/screens/login/components/header_widget.dart';
import 'package:authapp/screens/login/login_value_notifiers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void requestLogin(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(LoginUserEvent(
          email: _emailController.text, password: _passwordController.text));
    }
  }

   @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          loginHeaderWidget(context),
          Expanded(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  EmailInputField(emailController: _emailController),
                  SizedBox(
                    height: 20.h,
                  ),
                  PasswordInputWidget(
                      valueNotifier: obscureLoginPassword,
                      labelText: "Password",
                      passwordController: _passwordController),
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: GestureDetector(
                          onTap: () {
                            context.pushNamed(RouteNames.changePassword);
                          },
                          child: Text(
                            "Change Password",
                            style: Theme.of(context).textTheme.displayMedium,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Login Successful!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else if (state is LoginError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor:
                                Theme.of(context).colorScheme.error,
                            content: Text(state.message),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return mainAppButton(
                            text: 'Login',
                            context: context,
                            loading: state is LoginLoading ? true : false,
                            onPressed: () {
                              requestLogin(context);
                            });
                      },
                    ),
                  ),
                  buttomComponent(context)
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
