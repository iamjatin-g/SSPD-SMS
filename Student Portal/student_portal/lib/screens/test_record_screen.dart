import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/custom_header.dart';
import '../widgets/test_card.dart'; // ✅ Import the reusable widget

class TestRecordScreen extends StatelessWidget {
  const TestRecordScreen({super.key});

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
            const CustomHeader(title: "Test Record"), // ✅ Custom header

            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
                  TestCard(
                    date: "30-01-2025",
                    day: "Wednesday",
                    teacher: "Miss Sharma",
                    subject: "English",
                    chapter: "Chp: 2",
                    marks: "45/50",
                    // color: Colors.blue,
                  ),
                  TestCard(
                    date: "29-01-2025",
                    day: "Wednesday",
                    teacher: "Mr. Mishra",
                    subject: "Maths",
                    chapter: "Chp: 1",
                    marks: "45/50",
                    // color: Colors.teal,
                  ),
                  TestCard(
                    date: "27-01-2025",
                    day: "Wednesday",
                    teacher: "Mr. Mishra",
                    subject: "Science",
                    chapter: "Chp: 1",
                    marks: "45/50",
                    // color: Colors.green,
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
