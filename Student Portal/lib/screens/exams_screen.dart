import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 0, // Keeps the bottom navigation bar unchanged
      child: const Center(
        child: Text("Exams Screen", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
