import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ImagesField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
            child: GestureDetector(
              onTap: () {
                if (Platform.isAndroid) {
                } else {}
              },
              child: CircleAvatar(
                radius: 44,
                backgroundColor: Colors.grey[300],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.camera,
                      color: Colors.white,
                      size: 40,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
