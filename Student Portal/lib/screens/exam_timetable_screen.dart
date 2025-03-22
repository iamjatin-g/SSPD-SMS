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
                  _buildTimetableCard("1 Mar", "English", "10:00 AM - 12:00 PM"),
                  _buildTimetableCard("2 Mar", "Maths", "12:30 PM - 02:30 PM"),
                  _buildTimetableCard("3 Mar", "Science", "03:00 PM - 05:00 PM"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // **Timetable Card UI**
  Widget _buildTimetableCard(String date, String subject, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent, width: 1.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // **Date Box**
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.blue,
            child: Text(
              date,
              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),

          // **Subject Name**
          Text(subject, style: const TextStyle(fontSize: 16)),

          // **Exam Timings (Right Aligned)**
          Text(
            time,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blueAccent),
          ),
        ],
      ),
    );
  }
}
