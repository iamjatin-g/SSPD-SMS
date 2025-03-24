import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/back_button_widget.dart'; // ✅ Import BackButtonWidget
import '../routes/app_routes.dart'; // ✅ Import AppRoutes for Named Navigation

class TimeTableScreen extends StatelessWidget {
  const TimeTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 1, // ✅ Timetable tab
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // ✅ Back Button & Title (Centered)
            Row(
              children: const [
                BackButtonWidget(goHome:true),
                Expanded(
                  child: Center(
                    child: Text(
                      "Timetable",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(width: 48), // ✅ Keeps title centered
              ],
            ),

            const SizedBox(height: 10),

            // ✅ Student Info
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

            // ✅ Timetable List
            Expanded(
              child: ListView(
                children: [
                  _buildTimetableCard(
                      context, 1, "7:00 to 7:30", "English", "Miss Sharma"),
                  _buildTimetableCard(
                      context, 2, "8:00 to 8:30", "English", "Miss Sharma"),
                  _buildTimetableCard(
                      context, 3, "8:30 to 9:00", "Marathi", "Miss Sharma"),
                  _buildTimetableCard(
                      context, 4, "9:00 to 9:30", "Hindi", "Miss Sharma"),

                  // ✅ Break Section
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text(
                        "Break",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),

                  _buildTimetableCard(
                      context, 5, "10:00 to 10:30", "Maths", "Mr. Verma"),
                  _buildTimetableCard(
                      context, 6, "10:30 to 11:00", "Science", "Mrs. Kapoor"),
                  _buildTimetableCard(
                      context, 7, "11:00 to 11:30", "History", "Miss Singh"),
                  _buildTimetableCard(
                      context, 8, "11:30 to 12:00", "Geography", "Mr. Sharma"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Timetable Card Widget
// ✅ Timetable Card Widget
  Widget _buildTimetableCard(BuildContext context, int period, String time,
      String subject, String teacher) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            period.toString(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(subject,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        subtitle: Text(
            "$time | $teacher", style: const TextStyle(fontSize: 14)),

        // ✅ Navigate to TimetableAssessmentScreen with Subject Name
        trailing: TextButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              AppRoutes.timetableAssessment, // ✅ Use the correct route
              arguments: {
                'subject': subject, // ✅ Pass Subject Name
              },
            );
          },
          child: const Text(
              "View Assessment", style: TextStyle(color: Colors.blue)),
        ),
      ),
    );
  }
}
