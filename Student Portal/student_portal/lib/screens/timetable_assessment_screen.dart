import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart'; // ✅ Import File Picker
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
  String? _selectedFileName; // ✅ Stores selected file name

  // ✅ Function to pick a file
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _selectedFileName = result.files.single.name;
      });
    }
  }

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

              // ✅ Class Activity (Attach File & Upload)
              Row(
                children: [
                  // ✅ Attach File Button
                  ElevatedButton(
                    onPressed: _pickFile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    child: const Text("Attach File", style: TextStyle(color: Colors.black)),
                  ),

                  const SizedBox(width: 10),

                  // ✅ Display Selected File Name
                  Expanded(
                    child: Text(
                      _selectedFileName ?? "No file selected",
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  const SizedBox(width: 10),

                  // ✅ Upload Button
                  ElevatedButton(
                    onPressed: () {}, // ✅ Implement Upload Logic
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
