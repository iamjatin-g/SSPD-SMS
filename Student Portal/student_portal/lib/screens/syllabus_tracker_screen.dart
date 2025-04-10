import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/custom_header.dart';
import '../widgets/subject_card.dart'; // 🔽 Import the new SubjectCard widget

class SyllabusTrackerScreen extends StatelessWidget {
  const SyllabusTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 0,
      child: Padding(
        // padding: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomHeader(title: "Syllabus Tracker"),
            const SizedBox(height: 10),

            Row(
              children: const [
                Icon(Icons.menu_book_rounded, color: Colors.blue, size: 24),
                SizedBox(width: 8),
                Text(
                  "Subjects",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: const [
                  SubjectCard(letter: "E", subject: "English", color: Colors.blue),
                  SubjectCard(letter: "M", subject: "Maths", color: Colors.teal),
                  SubjectCard(letter: "S", subject: "Science", color: Colors.green),
                  SubjectCard(letter: "H", subject: "History", color: Colors.red),
                  SubjectCard(letter: "G", subject: "Geography", color: Colors.orange),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
