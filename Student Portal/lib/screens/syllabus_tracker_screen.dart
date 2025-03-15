import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';

class SyllabusTrackerScreen extends StatelessWidget {
  const SyllabusTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 0, // Adjust as needed
      child: const Center(
        child: Text(
          "Syllabus Tracker Screen",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
