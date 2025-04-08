import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/custom_header.dart';

class ViewInboxNoteScreen extends StatelessWidget {
  final String subject;
  final String message;
  final String date;

  const ViewInboxNoteScreen({
    super.key,
    required this.subject,
    required this.message,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 0,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom Header
            const CustomHeader(title: "View a Note"),

            const SizedBox(height: 20),

            // Subject Display
            Text(
              "Subject",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[800]),
            ),
            const SizedBox(height: 6),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                subject,
                style: const TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 20),

            // Message Display as Readonly TextField
            Text(
              "Message",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[800]),
            ),
            const SizedBox(height: 6),
            TextField(
              readOnly: true,
              maxLines: null,
              minLines: 8,
              controller: TextEditingController(text: message),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.all(14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
              ),
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),

            const SizedBox(height: 30),

            // Reply Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.reply, color: Colors.white, size: 20),
                label: const Text("Reply", style: TextStyle(fontSize: 16, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 3,
                ),
                onPressed: () {
                  // TODO: Handle reply functionality
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
