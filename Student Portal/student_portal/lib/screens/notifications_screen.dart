import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/back_button_widget.dart';
import '../services/api_service.dart'; // Import API service

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  Map<String, dynamic>? _latestEvent;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadLatestEvent();
  }

  Future<void> _loadLatestEvent() async {
    final latestEvent = await ApiService.fetchLatestEvent();
    setState(() {
      _latestEvent = latestEvent;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 2, // Notifications tab selected
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),

          // **Back Button & Title**
          Row(
            children: const [
              BackButtonWidget(goHome: true),
              Expanded(
                child: Center(
                  child: Text(
                    "Notifications",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(width: 48), // Keeps the title centered
            ],
          ),

          const SizedBox(height: 10),

          // **Header: Latest Event**
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  "Latest Event",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // **Student Details**
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Standard: 5th", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("Division: A", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // **Student Name**
          const Center(
            child: Text(
              "Student Name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 10),

          // **Latest Event**
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _latestEvent == null
              ? const Center(child: Text("No new events"))
              : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: NotificationCard(event: _latestEvent!),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

// **Notification Card Widget (View Button on the Right)**
class NotificationCard extends StatelessWidget {
  final Map<String, dynamic> event;
  const NotificationCard({super.key, required this.event});

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
            // **Event Details (Left Side)**
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // **Event Name**
                  Text(
                    event["name"] ?? "Event Name",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),

                  // **Event Date & Venue**
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

                  // **Managed By**
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

            // **View Button (Right Side)**
            TextButton(
              onPressed: () {
                // Handle View Button Click
                print("View Event: ${event["name"]}");
              },
              child: const Text(
                "View",
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
