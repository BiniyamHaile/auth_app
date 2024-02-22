import 'package:authapp/screens/components/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordInputWidget extends StatelessWidget {
  final ValueNotifier valueNotifier;
  final String labelText;
  final TextEditingController passwordController;
  final ValueNotifier ?  passwordNotifier;
  const PasswordInputWidget(
      {super.key,
      required this.valueNotifier,
      required this.labelText,
      required this.passwordController, 
      this.passwordNotifier
      });

  @override
  Widget build(BuildContext context) {
    IconData iconPassword = CupertinoIcons.eye_fill;
    IconData iconPasswordOff = CupertinoIcons.eye_slash_fill;
    return ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (context, value, child) {
          return CustomTextField(
              controller: passwordController,
              labelText: labelText,
              hintText: '********',
              obscureText: value,
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: IconButton(
                icon: Icon(
                value ?   iconPassword : iconPasswordOff,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  valueNotifier.value = !value;
                },
              ),
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Please fill in this field';
                }else if(passwordNotifier != null && val != passwordNotifier!.value){
                  return 'Password does not match';
                }
                return null;
              });
        });
  }
}
