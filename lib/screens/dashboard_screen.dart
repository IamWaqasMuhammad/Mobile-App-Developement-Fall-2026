import 'package:flutter/material.dart';
import 'package:practice_project/screens/course_catalog_screen.dart';
import 'package:practice_project/screens/student_profile.dart';
import 'counter_app.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),
      appBar: AppBar(
        title: const Text(
          'Main Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Welcome Back!',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFF263238),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Choose an option to get started.',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 24),

          _DashboardTile(
            icon: Icons.calculate_rounded,
            iconColor: Colors.blue.shade700,
            title: 'Counter App',
            subtitle: 'Explore your customized counter',
            tileColor: Colors.blue.shade50,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CounterApp(title: 'Counter App'),
                ),
              );
            },
          ),
          const SizedBox(height: 14),

          _DashboardTile(
            icon: Icons.person_rounded,
            iconColor: Colors.indigo.shade700,
            title: 'Student Profile',
            subtitle: 'View your student profile',
            tileColor: Colors.indigo.shade50,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StudentProfile()),
              );
            },
          ),
          const SizedBox(height: 14),

          _DashboardTile(
            icon: Icons.menu_book_rounded,
            iconColor: Colors.deepPurple.shade700,
            title: 'Course Catalog',
            subtitle: 'Explore available courses',
            tileColor: Colors.deepPurple.shade50,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CourseCatalogScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

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
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: tileColor, width: 1.2),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        leading: Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: tileColor,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, size: 28, color: iconColor),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(subtitle, style: const TextStyle(fontSize: 12)),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 16,
          color: Colors.black45,
        ),
        onTap: onTap,
      ),
    );
  }
}
