import 'package:authapp/screens/components/text_field.dart';
import 'package:flutter/cupertino.dart';

class FirstNameInput extends StatelessWidget {
  final TextEditingController firstNameController;
  const FirstNameInput({super.key, required this.firstNameController});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        controller: firstNameController,
        obscureText: false,
        labelText: 'First Name',
        hintText: 'Type your name here',
        keyboardType: TextInputType.name,
        validator: (val) {
          if (val!.isEmpty) {
            return 'Please fill in this field';
          }
          return null;
        });
  }
}
