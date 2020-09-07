import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: use_key_in_widget_constructors
class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget({
    this.textInputType,
    this.icon,
    this.obscureText = false,
    this.autocorrect = true,
  });

  final TextInputType textInputType;
  final IconData icon;
  final bool obscureText;
  final bool autocorrect;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.grey[700]),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        isDense: true,
        prefixIcon: Icon(icon),
      ),
      keyboardType: textInputType,
      obscureText: obscureText,
      autocorrect: autocorrect,
    );
  }
}
