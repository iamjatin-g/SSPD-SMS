import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/custom_header.dart'; // Import your custom header

class ExamTimetableScreen extends StatefulWidget {
  const ExamTimetableScreen({super.key});

  @override
  _ExamTimetableScreenState createState() => _ExamTimetableScreenState();
}

class _ExamTimetableScreenState extends State<ExamTimetableScreen> {
  int _selectedSemester = 3; // Default semester

  // **Exam schedules for different semesters**
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
        // padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // **Custom Header**
            const CustomHeader(title: "Exam Timetable"),

            const SizedBox(height: 10),

            // **Semester Dropdown**
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Semester: ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(width: 10),
                DropdownButton<int>(
                  value: _selectedSemester,
                  items: [3, 4, 5].map((int semester) {
                    return DropdownMenuItem<int>(
                      value: semester,
                      child: Text("Sem $semester", style: const TextStyle(fontSize: 16)),
                    );
                  }).toList(),
                  onChanged: (int? newValue) {
                    setState(() {
                      _selectedSemester = newValue!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),

            // **Timetable Header**
            const Center(
              child: Text(
                "Time-Table",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),

            // **Exam Schedule (Dynamically Updated)**
            Expanded(
              child: ListView.builder(
                itemCount: examSchedules[_selectedSemester]!.length,
                itemBuilder: (context, index) {
                  var schedule = examSchedules[_selectedSemester]![index];
                  return _buildTimetableCard(schedule["date"]!, schedule["subject"]!, schedule["time"]!);
                },
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
