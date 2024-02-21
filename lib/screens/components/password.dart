
import 'package:authapp/screens/components/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordInputWidget extends StatelessWidget {
  final ValueNotifier valueNotifier;
  final String labelText;
  final TextEditingController passwordController;
  const PasswordInputWidget({
    required this.valueNotifier , 
    required this.labelText, 
    required this.passwordController
  });
  

  @override
  Widget build(BuildContext context) {
      IconData iconPassword = CupertinoIcons.eye_fill;

    return  ValueListenableBuilder(
                          valueListenable:  valueNotifier,
                          builder: (context, value,
                               child) {
                            return CustomTextField(
                                controller: passwordController,
                                labelText: 'Password',
                                hintText: '********',
                                obscureText: value,
                                keyboardType: TextInputType.visiblePassword,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    iconPassword,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  onPressed: () {
                                   valueNotifier.value = !value;
                                  },
                                ),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Please fill in this field';
                                  }
                                  return null;
                                });
                          });
  }
}