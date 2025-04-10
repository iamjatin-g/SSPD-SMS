import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/custom_header.dart';
import '../services/api_service.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<Map<String, dynamic>> _notifications = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadLatestEvent();
  }

  Future<void> _loadLatestEvent() async {
    try {
      final latestEvent = await ApiService.fetchLatestEvent();
      setState(() {
        if (latestEvent != null) {
          _notifications.add(latestEvent);
        }
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      print("Error fetching latest event: $error");
    }
  }

  void _deleteNotification(int index) {
    setState(() {
      _notifications.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        // padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // **Custom Header (Same as Exams & Events Screens)**
            const CustomHeader(title: "Notifications", goHome: true),

            const SizedBox(height: 10),

            // **Notifications List**
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _notifications.isEmpty
                  ? const Center(child: Text("No new notifications"))
                  : ListView.builder(
                itemCount: _notifications.length,
                itemBuilder: (context, index) {
                  final event = _notifications[index];
                  return Dismissible(
                    key: Key(event["name"] ?? "event_$index"),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (direction) {
                      _deleteNotification(index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                      child: NotificationCard(event: event),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// **Notification Card Widget**
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
            // **Event Details**
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event["name"] ?? "Event Name",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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

            // **View Button**
            TextButton(
              onPressed: () {
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
