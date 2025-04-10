import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../widgets/base_screen.dart';
import '../widgets/custom_header.dart';

class FeesRecordScreen extends StatefulWidget {
  const FeesRecordScreen({super.key});

  @override
  State<FeesRecordScreen> createState() => _FeesRecordScreenState();
}

class _FeesRecordScreenState extends State<FeesRecordScreen> {
  int _selectedTab = 0;

  final double totalFees = 40000;
  final double paidFees = 30000;
  final double unpaidFees = 10000;

  @override
  Widget build(BuildContext context) {
    Map<String, double> dynamicQuarterData = _calculateQuarterData();
    List<Color> dynamicColorList = _generateQuarterColors(dynamicQuarterData);

    return BaseScreen(
      selectedIndex: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        // padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CustomHeader(title: "Fees Record"),
            const SizedBox(height: 10),

            Container(
              height: 42,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  _buildTabButton("Overview", 0),
                  _buildTabButton("Fee Breakdown", 1),
                ],
              ),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _selectedTab == 0
                        ? _buildOverviewSection()
                        : _buildFeeBreakdownSection(
                        dynamicQuarterData, dynamicColorList),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () {
                        // Handle payment
                      },
                      child: const Text(
                        "Pay Now",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String label, int index) {
    final isActive = _selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTab = index),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: isActive ? Colors.blue : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOverviewSection() {
    return Column(
      children: [
        _buildInfoCard(Icons.account_balance_wallet, "Total Fees", "₹${totalFees.toStringAsFixed(0)}", Colors.blue.shade700, Colors.blue.shade400),
        _buildInfoCard(Icons.check_circle, "Paid Fees", "₹${paidFees.toStringAsFixed(0)}", Colors.blue.shade600, Colors.blue.shade300),
        _buildInfoCard(Icons.cancel, "Unpaid Fees", "₹${unpaidFees.toStringAsFixed(0)}", Colors.blue.shade300, Colors.blue.shade100),
      ],
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String amount, Color colorStart, Color colorEnd) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colorStart, colorEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.2),
            radius: 22,
            child: Icon(icon, size: 24, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                amount,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 🧠 Generate Pie Chart Data Based on Paid %
  Map<String, double> _calculateQuarterData() {
    double percentagePaid = paidFees / totalFees;
    int paidQuarters = (percentagePaid * 4).floor(); // 0 to 4
    Map<String, double> data = {};

    for (int i = 1; i <= 4; i++) {
      String label = "Quarter $i (${i <= paidQuarters ? "Paid" : "Unpaid"})";
      data[label] = 1;
    }
    return data;
  }

  // 🎨 Blue Themed Colors for Pie Chart
  List<Color> _generateQuarterColors(Map<String, double> data) {
    return data.keys.map((label) {
      return label.contains("Paid")
          ? Colors.blue.shade600
          : Colors.blue.shade200;
    }).toList();
  }

  Widget _buildFeeBreakdownSection(
      Map<String, double> data, List<Color> colors) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                "Your Fee Progress",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              PieChart(
                dataMap: data,
                chartType: ChartType.disc,
                chartRadius: MediaQuery.of(context).size.width / 2,
                chartValuesOptions: const ChartValuesOptions(
                  showChartValuesInPercentage: false,
                  showChartValues: false,
                ),
                legendOptions: const LegendOptions(
                  legendPosition: LegendPosition.bottom,
                  legendTextStyle: TextStyle(fontSize: 14),
                ),
                colorList: colors,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
