import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/back_button_widget.dart';
import '../routes/app_routes.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  int _selectedTab = 0; // 0 = Inbox, 1 = Sent

  final List<Map<String, String>> inboxMessages = [
    {"subject": "Math Homework", "body": "Solve 10 questions", "date": "15 Feb, Sat"},
    {"subject": "Science Project", "body": "Prepare for model making", "date": "14 Feb, Fri"},
    {"subject": "English Essay", "body": "Write an essay on nature", "date": "13 Feb, Thu"},
    {"subject": "History Notes", "body": "Complete chapter 5 notes", "date": "12 Feb, Wed"},
  ];

  final List<Map<String, String>> sentMessages = [
    {"subject": "Leave Request", "body": "Absent on 16th Feb", "date": "15 Feb, Sat"},
    {"subject": "Project Submission", "body": "Submitted my assignment", "date": "14 Feb, Fri"},
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // **Back Button & Centered Heading**
            Row(
              children: [
                const BackButtonWidget(),
                Expanded(
                  child: Center(
                    child: const Text(
                      "Diary",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 48),
              ],
            ),

            const SizedBox(height: 10),

            // **Student Details**
            const Text(
              "Standard: 5th  |  Division: A",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              "Student Name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // **Search Bar**
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search Message",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.add, size: 30, color: Colors.blue),
                  onPressed: () {
                    // Add message functionality
                  },
                ),
              ],
            ),

            const SizedBox(height: 10),

            // **Inbox/Sent Tabs with Improved UI**
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  _buildTabButton("Inbox", 0),
                  _buildTabButton("Sent", 1),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // **Message List (Updates Dynamically)**
            Expanded(
              child: ListView.builder(
                itemCount: _selectedTab == 0 ? inboxMessages.length : sentMessages.length,
                itemBuilder: (context, index) {
                  var message = _selectedTab == 0 ? inboxMessages[index] : sentMessages[index];
                  return _buildMessageTile(
                      index + 1, message["subject"]!, message["body"]!, message["date"]!, context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // **Tab Button with Rounded Selection**
  Widget _buildTabButton(String label, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTab = index;
          });
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _selectedTab == index ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: _selectedTab == index ? Colors.blue : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  // **Message Tile**
  Widget _buildMessageTile(int number, String subject, String body, String date, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5),
              ),
              alignment: Alignment.center,
              child: Text(
                "$number",
                style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject.isNotEmpty ? subject : "No Subject",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(body, style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(date, style: const TextStyle(fontSize: 14)),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.viewInboxNote,
                      arguments: {
                        'subject': subject,
                        'message': body,
                        'date': date,
                      },
                    );
                  },
                  child: const Text(
                    "View",
                    style: TextStyle(color: Colors.blue),
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
