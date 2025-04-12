import 'package:flutter/material.dart';
import 'syllabus_item.dart';
import '../routes/app_routes.dart';

class ChapterListWidget extends StatelessWidget {
  final String chapter;
  final List<Map<String, String>> items;
  final String subject;

  const ChapterListWidget({
    super.key,
    required this.chapter,
    required this.items,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0), // Reduced padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            chapter,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 8), // Reduced space between chapter title and list
          ...items.map((item) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8), // Reduced spacing between items
              child: SyllabusItem(
                number: item['number']!,
                subject: item['subject']!,
                chapter: chapter,
                teacher: item['teacher']!,
                onViewAssessment: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.assessment,
                    arguments: {'subject': subject, 'chapter': chapter},
                  );
                },
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
