import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final Map<String, dynamic> event;
  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event["name"] ?? "Event Name",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.event, color: Colors.blue, size: 18),
                      const SizedBox(width: 5),
                      Text(
                        event["date"] ?? "Date not available",
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.location_on, color: Colors.red, size: 18),
                      const SizedBox(width: 5),
                      Text(
                        event["venue"] ?? "Venue not available",
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.person, color: Colors.green, size: 18),
                      const SizedBox(width: 5),
                      Text(
                        "Managed by: ${event["managedBy"] ?? "N/A"}",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
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
