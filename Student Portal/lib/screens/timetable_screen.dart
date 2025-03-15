import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';

class TimeTableScreen extends StatelessWidget {
  const TimeTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 1, // ✅ Time Table is selected
      child: const Center(
        child: Text("Time Table Screen", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
