import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'back_button_widget.dart'; // Ensure this widget is correctly imported

class CustomHeader extends StatelessWidget {
  final String title;
  final bool goHome; // Optional parameter for back button behavior

  const CustomHeader({super.key, required this.title, this.goHome = false});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat(
      'dd MMM yyyy | EEEE',
    ).format(DateTime.now());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),

        // Back Button & Title
        Row(
          children: [
            BackButtonWidget(goHome: goHome),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 48), // Keeps title centered
          ],
        ),

        const SizedBox(height: 10),

        // Date Display (Right-aligned)
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            formattedDate,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),

        const SizedBox(height: 10),

        // Student Info
        const Text(
          "Standard: 5th  |  Division: A",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 10),

        // Student Name
        const Center(
          child: Text(
            "Student Name",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),

        const Divider(thickness: 1, height: 20, color: Colors.blue),
      ],
    );
  }
}
