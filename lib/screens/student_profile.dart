import 'package:flutter/material.dart';
import '../widgets/course_tile.dart';
import '../widgets/summery_card.dart';

class StudentProfile extends StatelessWidget {
  const StudentProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PROFILE HEADER
            Row(
              children: [
                const CircleAvatar(
                  radius: 38,
                  backgroundColor: Colors.indigo,
                  child: Icon(Icons.person, color: Colors.white, size: 45),
                ),
                const SizedBox(width: 16),

                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Waqas Muhammad',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text('BS Computer Science'),
                      const SizedBox(height: 4),
                      const Text('5th Semester'),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Row(
              children: [
                Expanded(child: SummaryCard(label: 'CGPA', value: '3.75', icon: Icons.school)),
                Expanded(child: SummaryCard(label: 'Courses', value: '24', icon: Icons.menu_book)),
                Expanded(child: SummaryCard(label: 'Attendance', value: '92%', icon: Icons.check_circle)),
              ],
            ),

            const SizedBox(height: 24),

            // ABOUT SECTION
            Text(
              'About Me',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'I am a Computer Science student interested in Flutter, mobile app development, and software engineering.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // COURSES SECTION (Using Custom Widget)
            Text(
              'My Courses',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const CourseTile(
              title: 'Mobile App Development',
              subtitle: 'Flutter and Dart',
              icon: Icons.phone_android,
            ),
            const CourseTile(
              title: 'Web Programming',
              subtitle: 'MERN Stack & Javascript',
              icon: Icons.web,
            ),

            const SizedBox(height: 24),

            // BUTTONS ROW (Yahan 2 types ke buttons aur Expanded use hue hain)
            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.person),
                    label: const Text('View Profile'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.email),
                    label: const Text('Contact'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}