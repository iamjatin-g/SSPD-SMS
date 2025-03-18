import 'package:flutter/material.dart';
import '../widgets/base_screen.dart'; // Import BaseScreen

class AssessmentScreen extends StatelessWidget {
  const AssessmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 1, // No bottom navbar highlight needed
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Back Button
              IconButton(
                icon: const Icon(Icons.arrow_back, size: 28, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),

              // ✅ Header Section
              const Center(
                child: Text(
                  "TimeTable",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "15 Feb 2025 | Sat",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),

              // ✅ Student Info
              const Text(
                "Standard: 5th  |  Division: A",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "Student Name",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),

              // ✅ Subject Name (Always English)
              const Center(
                child: Text(
                  "English",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),

              // ✅ Chapter Selection
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Chapter:", style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 10),
                  Container(
                    width: 40,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text("V", style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // ✅ Classwork
              const Text("Classwork:", style: TextStyle(fontSize: 16)),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),

              // ✅ Class Activity (With Upload Button)
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: const Text("Upload", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // ✅ Homework
              const Text("Homework:", style: TextStyle(fontSize: 16)),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
