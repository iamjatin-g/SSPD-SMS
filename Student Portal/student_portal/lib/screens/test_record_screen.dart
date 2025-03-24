import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/back_button_widget.dart'; // ✅ Import Back Button Widget

class TestRecordScreen extends StatelessWidget {
  const TestRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 0, // ✅ Correct index for navigation
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // ✅ Back Button & Title (Centered)
            Row(
              children: const [
                BackButtonWidget(),
                Expanded(
                  child: Center(
                    child: Text(
                      "Test Record",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(width: 48), // Keeps title centered
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

            // ✅ Test Records List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
                  _buildTestCard("1", "30-01-2025", "Wednesday", "Miss Sharma", "English", "Chp: 2", "45/50", Colors.blue),
                  _buildTestCard("2", "29-01-2025", "Wednesday", "Mr. Mishra", "Maths", "Chp: 1", "45/50", Colors.teal),
                  _buildTestCard("3", "27-01-2025", "Wednesday", "Mr. Mishra", "Science", "Chp: 1", "45/50", Colors.green),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Function to build test record card
  Widget _buildTestCard(
      String number,
      String date,
      String day,
      String teacher,
      String subject,
      String chapter,
      String marks,
      Color color
      ) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                number,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$date  $day",
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  Text(
                    "$subject  -  $chapter",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  teacher,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  "($marks)",
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
