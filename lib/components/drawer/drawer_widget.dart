import 'package:flutter/material.dart';
import 'package:xlo/components/drawer/drawer_header_widget.dart';
import 'package:xlo/components/drawer/page_section.dart';

// ignore: use_key_in_widget_constructors
class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.horizontal(right: Radius.circular(50)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.70,
        child: Drawer(
          child: ListView(
            children: [
              DrawerHeaderWidget(),
              PageSection(),
            ],
          ),
        ),
      ),
    );
  }
}