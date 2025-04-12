import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/custom_header.dart';
import '../widgets/timetable_card.dart'; // ✅ Import reusable widget
import '../routes/app_routes.dart';

class TimeTableScreen extends StatelessWidget {
  const TimeTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomHeader(title: "Timetable", goHome: true),
            const SizedBox(height: 5),

            // ✅ Timetable List
            Expanded(
              child: ListView(
                children: [
                  TimetableCardWidget(
                    period: 1,
                    time: "7:00 to 7:30",
                    subject: "English",
                    teacher: "Miss Sharma",
                    onViewAssessment: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.timetableAssessment,
                        arguments: {'subject': "English"},
                      );
                    },
                  ),
                  TimetableCardWidget(
                    period: 2,
                    time: "8:00 to 8:30",
                    subject: "English",
                    teacher: "Miss Sharma",
                    onViewAssessment: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.timetableAssessment,
                        arguments: {'subject': "English"},
                      );
                    },
                  ),
                  TimetableCardWidget(
                    period: 3,
                    time: "8:30 to 9:00",
                    subject: "Marathi",
                    teacher: "Miss Sharma",
                    onViewAssessment: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.timetableAssessment,
                        arguments: {'subject': "Marathi"},
                      );
                    },
                  ),
                  TimetableCardWidget(
                    period: 4,
                    time: "9:00 to 9:30",
                    subject: "Hindi",
                    teacher: "Miss Sharma",
                    onViewAssessment: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.timetableAssessment,
                        arguments: {'subject': "Hindi"},
                      );
                    },
                  ),

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

                  TimetableCardWidget(
                    period: 5,
                    time: "10:00 to 10:30",
                    subject: "Maths",
                    teacher: "Mr. Verma",
                    onViewAssessment: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.timetableAssessment,
                        arguments: {'subject': "Maths"},
                      );
                    },
                  ),
                  TimetableCardWidget(
                    period: 6,
                    time: "10:30 to 11:00",
                    subject: "Science",
                    teacher: "Mrs. Kapoor",
                    onViewAssessment: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.timetableAssessment,
                        arguments: {'subject': "Science"},
                      );
                    },
                  ),
                  TimetableCardWidget(
                    period: 7,
                    time: "11:00 to 11:30",
                    subject: "History",
                    teacher: "Miss Singh",
                    onViewAssessment: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.timetableAssessment,
                        arguments: {'subject': "History"},
                      );
                    },
                  ),
                  TimetableCardWidget(
                    period: 8,
                    time: "11:30 to 12:00",
                    subject: "Geography",
                    teacher: "Mr. Sharma",
                    onViewAssessment: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.timetableAssessment,
                        arguments: {'subject': "Geography"},
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
