import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/custom_header.dart'; // ✅ Import the new reusable header

class AnnouncementsScreen extends StatelessWidget {
  const AnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Use the CustomHeader Widget
            const CustomHeader(title: "Announcements", goHome: true),

            // ✅ Announcements List
            Expanded(
              child: ListView(
                children: [
                  AnnouncementCard(
                    number: 1,
                    title: "Important Notice",
                    body: "School will remain closed on 26th Feb due to public holiday.",
                    dateDay: "26 Feb 2025 | Monday",
                    author: "Principal John Doe",
                  ),
                  AnnouncementCard(
                    number: 2,
                    title: "Examination Schedule",
                    body: "Final exam schedule has been released. Check your syllabus accordingly.",
                    dateDay: "20 March 2025 | Wednesday",
                    author: "Exam Coordinator Jane Smith",
                  ),
                  AnnouncementCard(
                    number: 3,
                    title: "Annual Sports Meet",
                    body: "All students are encouraged to participate in our annual sports meet.",
                    dateDay: "10 March 2025 | Sunday",
                    author: "Sports Department",
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

// 📌 Announcement Card Widget (Unchanged)
class AnnouncementCard extends StatelessWidget {
  final int number;
  final String title;
  final String body;
  final String dateDay;
  final String author;

  const AnnouncementCard({
    super.key,
    required this.number,
    required this.title,
    required this.body,
    required this.dateDay,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.blue.shade300, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row with Number, Title, and Author Name
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    number.toString(),
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "by",
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    Text(
                      author,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Announcement Body Text
            Text(
              body,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 5),

            // Date and Day
            Text(
              dateDay,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey[600]),
            ),

            // Read More Button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Read More",
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
