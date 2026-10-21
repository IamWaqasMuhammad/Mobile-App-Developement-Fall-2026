import 'package:flutter/material.dart';

import '../models/course_model.dart';
import '../widgets/course_card.dart';
import '../widgets/course_catalog_banner.dart';
import '../widgets/course_catalog_drawer.dart';
import 'course_details_screen.dart';

class CourseCatalogScreen extends StatelessWidget {
  const CourseCatalogScreen({super.key});

  void _openCourse(BuildContext context, CourseModel course) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CourseDetailsScreen(course: course),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      appBar: AppBar(
        title: const Text(
          'Course Catalog',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 0.3,
          ),
        ),
        centerTitle: true,
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const CourseCatalogDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 700) {
            return Column(
              children: [
                const CourseCatalogBanner(),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFF5F7FF), Color(0xFFEDE7F6)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: GridView.builder(
                      padding: const EdgeInsets.all(20),
                      itemCount: courses.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.5,
                            crossAxisSpacing: 18,
                            mainAxisSpacing: 18,
                          ),
                      itemBuilder: (context, index) {
                        return CourseCard(
                          course: courses[index],
                          isGrid: true,
                          onTap: () => _openCourse(context, courses[index]),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }

          return Column(
            children: [
              const CourseCatalogBanner(),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFF5F7FF), Color(0xFFEDE7F6)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(14, 16, 14, 24),
                    itemCount: courses.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: CourseCard(
                          course: courses[index],
                          onTap: () => _openCourse(context, courses[index]),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
