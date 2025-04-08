import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/custom_header.dart';

class TimetableAssessmentScreen extends StatefulWidget {
  const TimetableAssessmentScreen({super.key});

  @override
  _TimetableAssessmentScreenState createState() =>
      _TimetableAssessmentScreenState();
}

class _TimetableAssessmentScreenState extends State<TimetableAssessmentScreen> {
  int _selectedChapter = 1;

  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final String subject = args?['subject'] ?? "Subject";

    return BaseScreen(
      selectedIndex: 1,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Custom Header
              const CustomHeader(title: "Assessment"),

              const SizedBox(height: 10),

              // ✅ Subject Name
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
                      underline: Container(),
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
              Text("Classwork for Chapter $_selectedChapter:",
                  style: const TextStyle(fontSize: 16)),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
              ),

              const SizedBox(height: 10),

              // ✅ Class Activity (Static Attach File + Upload)
              Row(
                children: [
                  // ✅ Static Attach File Button
                  ElevatedButton(
                    onPressed: () {
                      // Do nothing or show a snackbar
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    child: const Text("Attach File", style: TextStyle(color: Colors.black)),
                  ),

                  const SizedBox(width: 10),

                  // ✅ Static file label
                  const Expanded(
                    child: Text(
                      "demo_file.pdf",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  const SizedBox(width: 10),

                  // ✅ Upload Button
                  ElevatedButton(
                    onPressed: () {
                      // Add your static upload logic here if needed
                    },
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
              Text("Homework for Chapter $_selectedChapter:",
                  style: const TextStyle(fontSize: 16)),
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