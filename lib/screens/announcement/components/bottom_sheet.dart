import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  BottomSheetWidget({
    this.text,
    this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(text),
      onPressed: onPressed,
    );
  }
}
