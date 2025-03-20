import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../widgets/base_screen.dart';
import '../widgets/back_button_widget.dart';

class FeesRecordScreen extends StatelessWidget {
  const FeesRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // **Back Button & Title**
            Row(
              children: [
                const BackButtonWidget(),
                Expanded(
                  child: Center(
                    child: Text(
                      "Fees Record",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 48), // Keeps the title centered
              ],
            ),
            const SizedBox(height: 15),

            // **Student Name**
            const Text(
              "Student Name",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            // **Paid & Unpaid Fees Buttons**
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildRoundedButton("Paid Fees"),
                const SizedBox(width: 12),
                _buildRoundedButton("Unpaid Fees"),
              ],
            ),
            const SizedBox(height: 20),

            // **Pie Chart**
            _buildImprovedPieChart(),
            const SizedBox(height: 25),

            // **"Pay Now" Button**
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Pay Now",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Helper Widget for Rounded Buttons
  Widget _buildRoundedButton(String text) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue.shade700,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadowColor: Colors.blue.withOpacity(0.5),
          elevation: 3,
        ),
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }

  // 🎯 Improved Pie Chart (without unnecessary background)
  Widget _buildImprovedPieChart() {
    Map<String, double> dataMap = {
      "Quarter 1": 25,
      "Quarter 2": 25,
      "Quarter 3": 25,
      "Quarter 4": 25,
    };

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      shadowColor: Colors.black26,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: PieChart(
          dataMap: dataMap,
          chartRadius: 180,
          ringStrokeWidth: 16,
          legendOptions: const LegendOptions(
            legendPosition: LegendPosition.bottom,
            legendTextStyle: TextStyle(fontSize: 16),
          ),
          chartValuesOptions: const ChartValuesOptions(
            showChartValues: false,
            showChartValuesOutside: false,
            decimalPlaces: 1,
          ),
          colorList: [
            Colors.blue.shade800,
            Colors.blue.shade600,
            Colors.blue.shade400,
            Colors.blue.shade200,
          ],
        ),
      ),
    );
  }
}
