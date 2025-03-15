import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 1, // ✅ Calendar is selected
      child: const Center(
        child: Text("Calendar Screen", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
