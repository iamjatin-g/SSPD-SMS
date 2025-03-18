import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/back_button_widget.dart'; // ✅ Import BackButtonWidget

class DiaryScreen extends StatelessWidget {
  const DiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 0, // ✅ Adjust as needed
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // ✅ Back Button & Title (Centered)
            Row(
              children: const [
                BackButtonWidget(),
                Expanded(
                  child: Center(
                    child: Text(
                      "Diary",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(width: 48), // ✅ Keeps title centered
              ],
            ),

            const Expanded(
              child: Center(
                child: Text(
                  "Diary Screen",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
