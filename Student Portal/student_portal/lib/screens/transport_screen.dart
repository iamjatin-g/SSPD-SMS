import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/back_button_widget.dart'; // ✅ Import Back Button Widget

class TransportScreen extends StatelessWidget {
  const TransportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 0, // ✅ Correct index for navigation
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
                      "Transport",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(width: 48), // Keeps title centered
              ],
            ),

            const SizedBox(height: 10),

            // ✅ Student Details
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

            // ✅ Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Transport",
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.blue),
                    onPressed: () {
                      // Handle search functionality
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // ✅ Transport Cards List
            Expanded(
              child: ListView(
                children: [
                  TransportCard(
                    busNo: "3",
                    status: "Live",
                    pickup: "Location (Time)",
                    drop: "Location (Time)",
                    driver: "Driver Name (Contact no.)",
                    supervisor: "Supervisor Name (Contact no.)",
                    timeAgo: "Live",
                  ),
                  const SizedBox(height: 10),
                  TransportCard(
                    busNo: "3",
                    status: "Ended",
                    pickup: "Location (Time)",
                    drop: "Location (Time)",
                    driver: "Driver Name (Contact no.)",
                    supervisor: "Supervisor Name (Contact no.)",
                    timeAgo: "7 Hours ago",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ Transport Card Widget
class TransportCard extends StatelessWidget {
  final String busNo;
  final String status;
  final String pickup;
  final String drop;
  final String driver;
  final String supervisor;
  final String timeAgo;

  const TransportCard({
    super.key,
    required this.busNo,
    required this.status,
    required this.pickup,
    required this.drop,
    required this.driver,
    required this.supervisor,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.blue.shade300, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Bus number and status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.directions_bus, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(
                      "Bus no $busNo",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  timeAgo,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),

            const SizedBox(height: 5),

            // ✅ Pickup & Drop details
            Text("Pick Up: $pickup"),
            Text("Drop: $drop"),
            Text("Driver: $driver"),
            Text("Supervisor: $supervisor"),

            const SizedBox(height: 5),

            // ✅ Status Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Live Location"),
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: status == "Live" ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
