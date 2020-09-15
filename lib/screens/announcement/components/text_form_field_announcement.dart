import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldAnnouncement extends StatelessWidget {
  TextFormFieldAnnouncement({
    this.labelText,
    this.maxLines,
    this.prefixText,
    this.keyboardType,
    this.inputFormatters,
  });

  final String labelText;
  final int maxLines;
  final String prefixText;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
        prefixText: prefixText,
        contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
      ),
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
    );
  }
}
