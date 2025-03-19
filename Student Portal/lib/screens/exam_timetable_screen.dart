import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/back_button_widget.dart';

class ExamTimetableScreen extends StatelessWidget {
  const ExamTimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // **Back Button & Centered Title**
            Row(
              children: [
                const BackButtonWidget(),
                Expanded(
                  child: Center(
                    child: Text(
                      "Exam Timetable",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 48),
              ],
            ),
            const SizedBox(height: 10),

            // **Exam Date & Student Details**
            const Text(
              "Exam   15 Feb 2025 | Sat",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              "Standard: 5th  |  Division: A",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),

            // **Timetable Header**
            const Center(
              child: Text(
                "Student Name",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
            const Center(
              child: Text(
                "Time-Table",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),

            // **Exam Schedule**
            Expanded(
              child: ListView(
                children: [
                  _buildTimetableCard("1 Mar", "English"),
                  _buildTimetableCard("2 Mar", "Maths"),
                  _buildTimetableCard("3 Mar", "Science"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // **Timetable Card UI**
  Widget _buildTimetableCard(String date, String subject) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent, width: 1.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          color: Colors.blue,
          child: Text(
            date,
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(subject, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
