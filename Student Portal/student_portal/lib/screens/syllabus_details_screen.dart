import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/custom_header.dart'; // Import CustomHeader
import '../widgets/chapter_list.dart'; // Import ChapterListWidget
import '../routes/app_routes.dart';

class SyllabusDetailsScreen extends StatelessWidget {
  const SyllabusDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve subject name from arguments
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final String subject = args?['subject'] ?? "Subject";

    // Fetch syllabus data (without async or reload functionality)
    final syllabusData = fetchSyllabusData(subject);

    return BaseScreen(
      selectedIndex: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // Custom Header
            const CustomHeader(title: "Syllabus Details"),

            const SizedBox(height: 5),

            // List of chapters
            Expanded(
              child: ListView.builder(
                itemCount: syllabusData.length,
                itemBuilder: (context, index) {
                  var chapterData = syllabusData[index];
                  return ChapterListWidget(
                    chapter: chapterData['chapter'],
                    items: chapterData['items'],
                    subject: subject,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Mock function to simulate fetching syllabus data from a backend API
  List<Map<String, dynamic>> fetchSyllabusData(String subject) {
    // Simulate network delay
    return [
      {
        'chapter': 'Chapter 1',
        'items': [
          {'number': '1', 'subject': subject, 'teacher': 'Miss Sharma'},
          {'number': '2', 'subject': subject, 'teacher': 'Miss Sharma'},
        ],
      },
      {
        'chapter': 'Chapter 2',
        'items': [
          {'number': '1', 'subject': subject, 'teacher': 'Miss Sharma'},
          {'number': '2', 'subject': subject, 'teacher': 'Miss Sharma'},
        ],
      },
      {
        'chapter': 'Chapter 3',
        'items': [
          {'number': '1', 'subject': subject, 'teacher': 'Miss Sharma'},
          {'number': '2', 'subject': subject, 'teacher': 'Miss Sharma'},
        ],
      },
    ];
  }
}
