import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/back_button_widget.dart';
import '../routes/app_routes.dart';

class SyllabusDetailsScreen extends StatelessWidget {
  const SyllabusDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Retrieve subject name from arguments
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final String subject = args?['subject'] ?? "Subject";

    return BaseScreen(
      selectedIndex: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // ✅ Back Button & Centered Title
            Row(
              children: const [
                BackButtonWidget(),
                Expanded(
                  child: Center(
                    child: Text(
                      "Syllabus Details",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(width: 48),
              ],
            ),

            const SizedBox(height: 10),

            // ✅ Student Details
            const Text(
              "Standard: 5th  |  Division: A",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            const Center(
              child: Text(
                "Student Name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            // ✅ Dynamic Subject Name
            Center(
              child: Text(
                subject,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            // ✅ Syllabus List
            Expanded(
              child: ListView(
                children: [
                  _buildChapterList(context, "Chapter 1", subject),
                  _buildChapterList(context, "Chapter 2", subject),
                  _buildChapterList(context, "Chapter 3", subject),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Function to Build Syllabus Items with Navigation to Assessment Screen
  Widget _buildChapterList(BuildContext context, String chapter, String subject) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          chapter,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        syllabusItem(context, "1", subject, chapter, "Miss Sharma"),
        syllabusItem(context, "2", subject, chapter, "Miss Sharma"),
        syllabusItem(context, "3", subject, chapter, "Miss Sharma"),
        syllabusItem(context, "4", subject, chapter, "Miss Sharma"),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget syllabusItem(BuildContext context, String number, String subject, String chapter, String teacher) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            number,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subject,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                chapter,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          Text(
            teacher,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.assessment,
                arguments: {
                  'subject': subject,
                  'chapter': chapter,
                },
              );
            },
            child: const Text(
              "View Assessment",
              style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
