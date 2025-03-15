import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 2, // ✅ Notifications is selected
      child: const Center(
        child: Text("Notifications Screen", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
