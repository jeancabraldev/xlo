import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: use_key_in_widget_constructors
class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget({
    this.textInputType,
    this.iconPre,
    this.iconSuf,
    this.obscureText = false,
    this.autocorrect = true,
    this.onChanged,
    this.errorText,
    this.enabled,
  });

  final TextInputType textInputType;
  final IconData iconPre;
  final Widget iconSuf;
  final bool obscureText;
  final bool autocorrect;
  final ValueChanged<String> onChanged;
  final String errorText;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.grey[700]),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        isDense: true,
        prefixIcon: Icon(iconPre),
        suffixIcon: iconSuf,
        errorText: errorText,
      ),
      keyboardType: textInputType,
      obscureText: obscureText,
      autocorrect: autocorrect,
      onChanged: onChanged,
      enabled: enabled,
    );
  }
}
