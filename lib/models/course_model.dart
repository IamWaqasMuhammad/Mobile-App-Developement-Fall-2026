import 'package:flutter/material.dart';

class CourseModel {
  const CourseModel({
    required this.code,
    required this.title,
    required this.description,
    required this.creditHours,
    required this.instructor,
    required this.icon,
    required this.color,
    required this.category,
  });

  final String code;
  final String title;
  final String description;
  final int creditHours;
  final String instructor;
  final IconData icon;
  final Color color;
  final String category;
}

const courses = <CourseModel>[
  CourseModel(
    code: 'CS-314',
    title: 'Mobile Application Development',
    description:
        'Design and build modern mobile applications with Flutter, Dart, '
        'responsive layouts, and practical user interface patterns.',
    creditHours: 3,
    instructor: 'Sir Moeen Ahmad',
    icon: Icons.phone_android_rounded,
    color: Color(0xFF315C4B),
    category: 'Development',
  ),
  CourseModel(
    code: 'CS-301',
    title: 'Data Structures & Algorithms',
    description:
        'Explore the core structures and algorithmic techniques used to '
        'create efficient, reliable software.',
    creditHours: 3,
    instructor: 'Sir Siddique Rehman',
    icon: Icons.account_tree_rounded,
    color: Color(0xFF4666A8),
    category: 'Computer Science',
  ),
  CourseModel(
    code: 'CS-305',
    title: 'Database Systems',
    description:
        'Learn how to model, query, and manage data with relational '
        'database systems.',
    creditHours: 3,
    instructor: 'Computer Science Faculty',
    icon: Icons.storage_rounded,
    color: Color(0xFF9A633B),
    category: 'Data',
  ),
  CourseModel(
    code: 'CS-307',
    title: 'Computer Networks',
    description:
        'Understand network architecture, communication protocols, and '
        'the foundations of the internet.',
    creditHours: 3,
    instructor: 'Sir Amer Taj',
    icon: Icons.hub_rounded,
    color: Color(0xFF7253A1),
    category: 'Systems',
  ),
  CourseModel(
    code: 'CS-309',
    title: 'Software Engineering',
    description:
        'Practice the processes and principles used to plan, develop, '
        'test, and maintain quality software.',
    creditHours: 3,
    instructor: 'Computer Science Faculty',
    icon: Icons.design_services_rounded,
    color: Color(0xFFB45151),
    category: 'Development',
  ),
  CourseModel(
    code: 'CS-311',
    title: 'Artificial Intelligence',
    description:
        'An introduction to intelligent systems, search, knowledge '
        'representation, and machine learning concepts.',
    creditHours: 3,
    instructor: 'Sir Dilawar Khan',
    icon: Icons.auto_awesome_rounded,
    color: Color(0xFF27827A),
    category: 'Emerging Tech',
  ),
];
