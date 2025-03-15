import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';

class FeesRecordScreen extends StatelessWidget {
  const FeesRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 0, // Adjust as needed
      child: const Center(
        child: Text(
          "Fees Record Screen",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
