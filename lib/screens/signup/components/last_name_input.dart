import 'package:authapp/screens/components/text_field.dart';
import 'package:flutter/cupertino.dart';

class LastNameInput extends StatelessWidget {
 final  TextEditingController lastNameController;
  LastNameInput({required  this.lastNameController});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
                          controller: lastNameController,
                          obscureText: false,
                          labelText: 'Last Name',
                          hintText: 'Type your last name here',
                          keyboardType: TextInputType.name,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please fill in this field';
                            }
                            return null;
                          });
  }
}