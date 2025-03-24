import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/back_button_widget.dart';
import '../services/api_service.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<Map<String, String>> notifications = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    List<Map<String, String>> data = await ApiService.fetchNotifications();
    setState(() {
      notifications = data;
      isLoading = false;
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

          // **Header with Date**
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  "15 Feb 2025 | Sat",
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
                Text("Standard : 5th", style: TextStyle(fontSize: 16)),
                Text("Division: A", style: TextStyle(fontSize: 16)),
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

          // **Notifications List**
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator()) // Show loader while fetching
                : notifications.isEmpty
                ? const Center(child: Text("No notifications available")) // Show message if empty
                : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return NotificationCard(notification: notifications[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// **Notification Card Widget**
class NotificationCard extends StatelessWidget {
  final Map<String, String> notification;
  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // **Number Box**
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                notification["id"]!,
                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 10),

            // **Notification Content**
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification["title"]!,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    notification["description"]!,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),

            // **Date & View Button**
            Column(
              children: [
                Text(
                  notification["date"]!,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "View",
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
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
