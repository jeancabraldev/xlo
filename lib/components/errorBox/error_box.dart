import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ErrorBox extends StatelessWidget {
  ErrorBox({this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    if (message == null) return Container();
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(
            FontAwesomeIcons.exclamationCircle,
            color: Colors.red,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              'Ops! $message',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
