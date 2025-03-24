import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/back_button_widget.dart';

class TimetableAssessmentScreen extends StatefulWidget {
  const TimetableAssessmentScreen({super.key});

  @override
  _TimetableAssessmentScreenState createState() => _TimetableAssessmentScreenState();
}

class _TimetableAssessmentScreenState extends State<TimetableAssessmentScreen> {
  // ✅ Default selected chapter
  int _selectedChapter = 1;

  @override
  Widget build(BuildContext context) {
    // ✅ Retrieve subject name from arguments
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final String subject = args?['subject'] ?? "Subject";

    return BaseScreen(
      selectedIndex: 1, // ✅ No bottom navbar highlight needed
      child: SafeArea(
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
                        "Assessment",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(width: 48), // ✅ Keeps title centered
                ],
              ),

              const SizedBox(height: 10),

              // ✅ Date Display (Right-aligned)
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

              // ✅ Dynamic Subject Name
              Center(
                child: Text(
                  subject,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 10),

              // ✅ Chapter Selection with Dropdown
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Chapter:", style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButton<int>(
                      value: _selectedChapter,
                      underline: Container(), // ✅ Removes default underline
                      onChanged: (int? newValue) {
                        setState(() {
                          _selectedChapter = newValue!;
                        });
                      },
                      items: [1, 2, 3, 4, 5].map<DropdownMenuItem<int>>(
                            (int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text("Chp $value", style: const TextStyle(fontSize: 16)),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // ✅ Classwork Section
              Text("Classwork for Chapter $_selectedChapter:", style: const TextStyle(fontSize: 16)),
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    ),
                    child: const Text("Upload", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // ✅ Homework Section
              Text("Homework for Chapter $_selectedChapter:", style: const TextStyle(fontSize: 16)),
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
