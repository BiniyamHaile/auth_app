import 'package:authapp/screens/components/text_field.dart';
import 'package:flutter/cupertino.dart';

class EmailInputField extends StatelessWidget {
  final TextEditingController emailController;
  const EmailInputField({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        controller: emailController,
        labelText: 'Email',
        hintText: 'Someone@example.com',
        obscureText: false,
        keyboardType: TextInputType.emailAddress,
        validator: (val) {
          if (val!.isEmpty) {
            return 'Please fill in this field';
          } else if (!RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$')
              .hasMatch(val)) {
            return 'Please enter a valid email';
          }
          return null;
        });
  }
}
