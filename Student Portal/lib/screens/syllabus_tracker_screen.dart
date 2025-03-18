import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../routes/app_routes.dart'; // ✅ Import AppRoutes

class SyllabusTrackerScreen extends StatelessWidget {
  const SyllabusTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 0, // Update with correct index for navigation
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Student Details Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Standard : 5th", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const Text("Division : A", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Center(
                  child: const Text(
                    "Student Name",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          // Subject Title
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

          // Subjects List
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
    );
  }

  // Function to Build Subject Cards with Navigation
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
            Navigator.pushNamed(context, AppRoutes.syllabusDetails);
          },
          child: const Text("View", style: TextStyle(fontSize: 16, color: Colors.blue)),
        ),
      ),
    );
  }
}
