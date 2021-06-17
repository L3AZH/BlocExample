import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget{

  final textController = TextEditingController();
  TextInputType? type;
  String? hint;

  CustomTextFromField(this.hint,this.type);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint!,
      ),
      controller: textController,
      keyboardType: type!,
    );
  }
}