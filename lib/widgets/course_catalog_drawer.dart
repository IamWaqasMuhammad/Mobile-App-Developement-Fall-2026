import 'package:flutter/material.dart';
import 'package:practice_project/screens/counter_app.dart';
import 'package:practice_project/screens/dashboard_screen.dart';
import 'package:practice_project/screens/student_profile.dart';

class CourseCatalogDrawer extends StatelessWidget {
  const CourseCatalogDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryNavy = Color(0xFF0F172A);
    const accentIndigo = Color(0xFF4F46E5);

    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Elegant Custom Header Section
          const DrawerHeader(
            decoration: BoxDecoration(color: primaryNavy),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white12,
                  child: Icon(
                    Icons.person_outline_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Waquas Muhammad',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'waqasmuhammad5254@gmail.com',
                  style: TextStyle(color: Colors.white60, fontSize: 13),
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Text(
              'Main Navigation',
              style: TextStyle(
                color: Colors.black38,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          _buildDrawerItem(
            context: context,
            icon: Icons.dashboard_customize_outlined,
            title: 'Dashboard',
            destination: DashboardScreen(),
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.calculate_outlined,
            title: 'Counter App',
            destination: CounterApp(title: 'Counter App'),
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.account_circle_outlined,
            title: 'Student Profile',
            destination: StudentProfile(),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required Widget destination,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF4F46E5)),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF0F172A),
            fontSize: 14,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
      ),
    );
  }
}
