import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? labelText;
  const MyTextField(
      {super.key,
      this.labelText,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFCBCBCB),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFCBCBCB),
          ),
        ),
        labelText: labelText,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFCBCBCB),
          ),
          borderRadius: BorderRadius.circular(1),
        ),
        fillColor: const Color(0xFFCBCBCB),
      ),
    );
  }
}
