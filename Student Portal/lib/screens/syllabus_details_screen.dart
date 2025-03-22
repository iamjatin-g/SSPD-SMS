import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/back_button_widget.dart';
import '../routes/app_routes.dart';

class SyllabusDetailsScreen extends StatelessWidget {
  const SyllabusDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                SizedBox(width: 48), // Keeps title centered
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

            const Center(
              child: Text(
                "English",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            // ✅ Syllabus List
            Expanded(
              child: ListView(
                children: [
                  const Text(
                    "Chp 1:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  syllabusItem(context, "1", "English", "Chp 1", "Miss Sharma"),
                  syllabusItem(context, "2", "English", "Chp 1", "Miss Sharma"),
                  syllabusItem(context, "3", "English", "Chp 1", "Miss Sharma"),
                  syllabusItem(context, "4", "English", "Chp 1", "Miss Sharma"),
                  const SizedBox(height: 10),

                  const Text(
                    "Chp 2:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  syllabusItem(context, "1", "English", "Chp 2", "Miss Sharma"),
                  syllabusItem(context, "2", "English", "Chp 2", "Miss Sharma"),
                  syllabusItem(context, "3", "English", "Chp 2", "Miss Sharma"),
                  syllabusItem(context, "4", "English", "Chp 2", "Miss Sharma"),
                  const SizedBox(height: 10),

                  const Text(
                    "Chp 3:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  syllabusItem(context, "1", "English", "Chp 3", "Miss Sharma"),
                  syllabusItem(context, "2", "English", "Chp 3", "Miss Sharma"),
                  syllabusItem(context, "3", "English", "Chp 3", "Miss Sharma"),
                  syllabusItem(context, "4", "English", "Chp 3", "Miss Sharma"),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Function to Build Syllabus Items with Navigation to Assessment Screen
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
              Navigator.pushNamed(context, AppRoutes.assessment);
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
