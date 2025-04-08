import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/custom_header.dart';
import '../widgets/announcement_card.dart'; // ✅ Import the new widget

class AnnouncementsScreen extends StatelessWidget {
  const AnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomHeader(title: "Announcements", goHome: true),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: const [
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

