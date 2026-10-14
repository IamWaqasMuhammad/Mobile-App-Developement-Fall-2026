
import 'package:flutter/material.dart';

// CHANGED: Custom reusable CourseTile widget
class CourseTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const CourseTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.indigo,
          size: 30,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}
