import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class FieldTitleWidget extends StatelessWidget {
  FieldTitleWidget({
    this.title,
    this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3, bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          Text(
            subTitle,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
