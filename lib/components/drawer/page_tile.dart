import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {
  PageTile({
    this.label,
    this.icon,
    this.onTap,
    this.highLighted,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool highLighted;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          color: highLighted ? Colors.deepPurpleAccent : Colors.grey[700],
          fontSize: 15,
        ),
      ),
      leading: Icon(
        icon,
        color: highLighted ? Colors.deepPurpleAccent : Colors.grey[700],
      ),
      onTap: onTap,
    );
  }
}
