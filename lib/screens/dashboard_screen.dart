import 'package:flutter/material.dart';
import 'package:practice_project/screens/student_profile.dart';
import 'counter_app.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Dashboard'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white, // Appbar text color better visibility ke liye
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _DashboardTile(
            icon: Icons.calculate,
            iconColor: Colors.blue,
            title: 'Counter App',
            subtitle: 'Go to your customized counter screen',
            tileColor: Colors.blue.shade50,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Counter App')),
              );
            },
          ),
          const SizedBox(height: 16),
          _DashboardTile(
            icon: Icons.person,
            iconColor: Colors.indigo,
            title: 'Student Profile',
            subtitle: 'Go to Lab 05 Profile Dashboard',
            tileColor: Colors.indigo.shade50,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StudentProfile()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Dashboard Tile Widget
class _DashboardTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final Color tileColor;
  final VoidCallback onTap;

  const _DashboardTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.tileColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 40, color: iconColor),
      title: Text(title),
      subtitle: Text(subtitle),
      tileColor: tileColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onTap: onTap,
    );
  }
}