import 'package:flutter/material.dart';
import 'package:xlo/components/drawer/drawer_widget.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          title: const Text('XLO'),
          centerTitle: true,
        ),
      ),
    );
  }
}
