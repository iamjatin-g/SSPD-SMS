import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/custom_header.dart';
import '../widgets/timetable_card.dart'; // Import the reusable timetable card

class ExamTimetableScreen extends StatefulWidget {
  const ExamTimetableScreen({super.key});

  @override
  _ExamTimetableScreenState createState() => _ExamTimetableScreenState();
}

class _ExamTimetableScreenState extends State<ExamTimetableScreen> {
  int _selectedSemester = 3; // Default semester

  // Exam schedules for different semesters
  final Map<int, List<Map<String, String>>> examSchedules = {
    3: [
      {"date": "1 Mar", "subject": "English", "time": "10:00 AM - 12:00 PM"},
      {"date": "2 Mar", "subject": "Maths", "time": "12:30 PM - 02:30 PM"},
      {"date": "3 Mar", "subject": "Science", "time": "03:00 PM - 05:00 PM"},
    ],
    4: [
      {"date": "5 Mar", "subject": "Physics", "time": "09:00 AM - 11:00 AM"},
      {"date": "6 Mar", "subject": "Chemistry", "time": "11:30 AM - 01:30 PM"},
      {"date": "7 Mar", "subject": "Biology", "time": "02:00 PM - 04:00 PM"},
    ],
    5: [
      {"date": "10 Mar", "subject": "History", "time": "08:00 AM - 10:00 AM"},
      {"date": "11 Mar", "subject": "Geography", "time": "10:30 AM - 12:30 PM"},
      {"date": "12 Mar", "subject": "Political Science", "time": "01:00 PM - 03:00 PM"},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomHeader(title: "Exam Timetable"),

            const SizedBox(height: 12),

            // Timetable Header (Enhanced)
            Center(
              child: Column(
                children: [
                  const Text(
                    "Time-Table",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),


            // Semester Dropdown (Clean Look)
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.school, color: Colors.blueAccent, size: 20),
                  const SizedBox(width: 8),
                  const Text(
                    "Semester:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 10),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                      value: _selectedSemester,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                      icon: const Icon(Icons.arrow_drop_down, color: Colors.blueAccent),
                      items: [3, 4, 5].map((int semester) {
                        return DropdownMenuItem<int>(
                          value: semester,
                          child: Text("Sem $semester"),
                        );
                      }).toList(),
                      onChanged: (int? newValue) {
                        setState(() {
                          _selectedSemester = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Exam Schedule
            Expanded(
              child: ListView.builder(
                itemCount: examSchedules[_selectedSemester]!.length,
                itemBuilder: (context, index) {
                  var schedule = examSchedules[_selectedSemester]![index];
                  return TimetableCard(
                    date: schedule["date"]!,
                    subject: schedule["subject"]!,
                    time: schedule["time"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
