import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../routes/app_routes.dart';
import '../widgets/back_button_widget.dart';

class SyllabusTrackerScreen extends StatelessWidget {
  const SyllabusTrackerScreen({super.key});

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

            // ✅ Back Button & Title
            Row(
              children: const [
                BackButtonWidget(),
                Expanded(
                  child: Center(
                    child: Text(
                      "Syllabus Tracker",
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

            // ✅ Subject Title
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                color: Colors.blue,
                child: const Text(
                  "Subjects",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),

            // ✅ Subjects List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
                  _buildSubjectCard(context, "E", "English", Colors.blue),
                  _buildSubjectCard(context, "M", "Maths", Colors.teal),
                  _buildSubjectCard(context, "S", "Science", Colors.green),
                  _buildSubjectCard(context, "H", "History", Colors.red),
                  _buildSubjectCard(context, "G", "Geography", Colors.orange),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Function to Build Subject Cards with Navigation
  Widget _buildSubjectCard(BuildContext context, String letter, String subject, Color color) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Text(
            letter,
            style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(subject, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        trailing: TextButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              AppRoutes.syllabusDetails,
              arguments: {'subject': subject},
            );
          },
          child: const Text("View", style: TextStyle(fontSize: 16, color: Colors.blue)),
        ),
      ),
    );
  }
}
