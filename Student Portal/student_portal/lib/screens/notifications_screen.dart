import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../widgets/base_screen.dart';
import '../widgets/custom_header.dart';
import '../widgets/notification_card.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  IO.Socket? socket;
  List<Map<String, String>> notifications = [];

  @override
  void initState() {
    super.initState();
    loadNotifications();
    connectSocket();
  }

  // Load notifications from shared preferences
  void loadNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? savedNotifications = prefs.getStringList('notifications');

    if (savedNotifications != null) {
      setState(() {
        notifications = savedNotifications.map((e) {
          final parts = e.split('|');
          return {
            'title': parts[0],
            'description': parts[1],
            'date': parts[2],
          };
        }).toList();
      });
    }
  }

  // Save notifications to shared preferences
  void saveNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    final savedNotifications = notifications
        .map((notification) =>
    '${notification['title']}|${notification['description']}|${notification['date']}')
        .toList();

    await prefs.setStringList('notifications', savedNotifications);
  }

  // Connect to the Socket.IO server
  void connectSocket() {
    socket = IO.io('http://10.0.2.2:3000', IO.OptionBuilder()
        .setTransports(['websocket'])
        .build());

    socket!.on('connect', (_) {
      print('connected to socket');
    });

    socket!.on('new_notification', (data) {
      print('New notification data: $data');
      setState(() {
        notifications.add({
          'title': data['title'],
          'description': data['description'],
          'date': data['date'],
        });
      });
      saveNotifications(); // Save to local storage
    });

    socket!.on('disconnect', (_) {
      print('disconnected from socket');
      connectSocket();
    });

    socket!.on('connect_error', (error) {
      print('Socket connection error: $error');
    });

    socket!.on('error', (error) {
      print('Socket error: $error');
    });
  }

  // Remove a notification from the list
  void removeNotification(int index) {
    final removed = notifications[index];

    setState(() {
      notifications.removeAt(index);
    });
    saveNotifications(); // Update the saved notifications

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Notification deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              notifications.insert(index, removed);
            });
            saveNotifications(); // Revert and save again
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    socket?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomHeader(title: "Notifications"),
            const SizedBox(height: 10),
            Expanded(
              child: notifications.isEmpty
                  ? Center(
                child: Text(
                  "No Notifications to read",
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              )
                  : ListView.separated(
                itemCount: notifications.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  final dismissKey = '${notification["title"]}-${notification["date"]}';

                  return Dismissible(
                    key: ValueKey(dismissKey),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (_) => removeNotification(index),
                    child: NotificationCard(notification: notification),
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
