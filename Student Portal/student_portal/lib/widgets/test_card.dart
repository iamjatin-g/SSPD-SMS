import 'package:flutter/material.dart';

class TestCard extends StatelessWidget {
  final String date;
  final String day;
  final String teacher;
  final String subject;
  final String chapter;
  final String marks;
  // final Color color;

  const TestCard({
    super.key,
    required this.date,
    required this.day,
    required this.teacher,
    required this.subject,
    required this.chapter,
    required this.marks,
    // required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main content (now spans full width)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$subject - $chapter",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),

                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 14, color: Colors.grey.shade600),
                      const SizedBox(width: 4),
                      Text(
                        "$date · $day",
                        style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  Row(
                    children: [
                      Icon(Icons.person, size: 14, color: Colors.grey.shade600),
                      const SizedBox(width: 4),
                      Text(
                        teacher,
                        style: TextStyle(fontSize: 13, color: Colors.grey.shade800, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Marks
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Marks",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  marks,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
