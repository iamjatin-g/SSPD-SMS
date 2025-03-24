import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/back_button_widget.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController subjectController = TextEditingController();
    TextEditingController messageController = TextEditingController();

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
              "Standard : 5th",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Division : A",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Center(
              child: Text(
                "Student Name",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),
            const Divider(color: Colors.blue, thickness: 1),

            const SizedBox(height: 10),

            // **Add a Note Heading**
            const Center(
              child: Text(
                "Add a Note",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 15),

            // **Subject Input Field**
            const Text("Subject:"),
            const SizedBox(height: 5),
            TextField(
              controller: subjectController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            // **Message Input Field**
            const Text("Message"),
            const SizedBox(height: 5),
            TextField(
              controller: messageController,
              maxLines: 6,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            // **Send Button**
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                onPressed: () {
                  // Handle sending note
                },
                child: const Text("Send", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
