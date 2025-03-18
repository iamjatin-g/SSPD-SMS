import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/back_button_widget.dart'; // Import BackButtonWidget

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // **Back Button & Centered Heading**
            Row(
              children: [
                const BackButtonWidget(), // Back button
                Expanded(
                  child: Center(
                    child: const Text(
                      "Exams Record",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 48), // To balance row spacing
              ],
            ),

            const SizedBox(height: 10),

            // **Student Details**
            const Text(
              "Standard: 5th  |  Division: A",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Student Name",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to Timetable screen
                    // Navigator.pushNamed(context, '/timetable');
                  },
                  child: const Text(
                    "View Timetable",
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // **Centered Exam Table**
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blueAccent, width: 1.5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    child: DataTable(
                      border: TableBorder.all(color: Colors.blueAccent),
                      columnSpacing: 30,
                      columns: const [
                        DataColumn(
                          label: Text(
                            "Subject",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Sem 1",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Sem 2",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                      rows: [
                        _buildTableRow("English", "45/50", "40/50"),
                        _buildTableRow("Maths", "42/50", "48/50"),
                        _buildTableRow("Science", "38/50", "44/50"),
                        _buildTableRow("History", "40/50", "42/50"),
                        _buildTableRow("Geography", "39/50", "43/50"),
                        _buildTableRow("Total Marks", "204/250", "217/250",
                            isBold: true),
                        _buildTableRow("Percentage", "81.6%", "86.8%",
                            isBold: true),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // **Function to create table rows with better spacing**
  DataRow _buildTableRow(String subject, String sem1, String sem2,
      {bool isBold = false}) {
    TextStyle textStyle = TextStyle(
      fontSize: 14,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      color: isBold ? Colors.blueAccent : Colors.black,
    );

    return DataRow(cells: [
      DataCell(Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(subject, style: textStyle),
      )),
      DataCell(Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(sem1, style: textStyle),
      )),
      DataCell(Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(sem2, style: textStyle),
      )),
    ]);
  }
}
