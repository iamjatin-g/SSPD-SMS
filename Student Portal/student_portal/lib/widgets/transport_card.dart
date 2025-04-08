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
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.blue.shade100, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.directions_bus, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(
                      "Bus No. $busNo",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  timeAgo,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 10),

            Divider(color: Colors.blue.shade100),

            // Pickup & Drop
            Row(
              children: [
                const Icon(Icons.arrow_upward, color: Colors.green, size: 20),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    "Pickup: $pickup",
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.arrow_downward, color: Colors.red, size: 20),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    "Drop: $drop",
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Driver & Supervisor
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.person, color: Colors.blueAccent, size: 20),
                const SizedBox(width: 6),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Driver: $driver", style: const TextStyle(fontSize: 13)),
                      const SizedBox(height: 4),
                      Text("Supervisor: $supervisor", style: const TextStyle(fontSize: 13)),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Status bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.location_on, size: 16, color: Colors.blue),
                    SizedBox(width: 4),
                    Text("Live Location", style: TextStyle(fontSize: 13)),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: status == "Live" ? Colors.green.shade100 : Colors.red.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: status == "Live" ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
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
