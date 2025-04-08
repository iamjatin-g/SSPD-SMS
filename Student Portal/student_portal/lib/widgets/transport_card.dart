import 'package:flutter/material.dart';

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
            // Bus number and status
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
            Text("Pick Up: $pickup"),
            Text("Drop: $drop"),
            Text("Driver: $driver"),
            Text("Supervisor: $supervisor"),

            const SizedBox(height: 5),
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
