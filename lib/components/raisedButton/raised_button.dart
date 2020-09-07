import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class RaisedButtonWidget extends StatelessWidget {
  RaisedButtonWidget({
    this.onPressed,
    this.colorButton,
    this.textButton,
    this.textColorButton,
  });

  final VoidCallback onPressed;
  final Color colorButton;
  final String textButton;
  final Color textColorButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      height: 45,
      child: RaisedButton(
        onPressed: onPressed,
        color: colorButton,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          textButton,
          style: TextStyle(
            color: textColorButton,
          ),
        ),
      ),
    );
  }
}
