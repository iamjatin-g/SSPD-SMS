import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../services/api_service.dart'; // ✅ Import API service

class BaseScreen extends StatefulWidget {
  final Widget child;
  final int selectedIndex;

  const BaseScreen({super.key, required this.child, required this.selectedIndex});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  bool _hasNewNotification = false; // ✅ Red dot state

  @override
  void initState() {
    super.initState();
    _checkForNewAnnouncements();
  }

  Future<void> _checkForNewAnnouncements() async {
    final latestEvent = await ApiService.fetchLatestEvent();
    if (latestEvent != null) {
      setState(() {
        _hasNewNotification = true;
      });
    }
  }

  void _onItemTapped(int index) {
    String route = AppRoutes.home;
    if (index == 1) {
      route = AppRoutes.timeTable;
    } else if (index == 2) {
      route = AppRoutes.announcements;
    }

    if (ModalRoute.of(context)?.settings.name != route) {
      Navigator.pushReplacementNamed(context, route);
    }
  }

  void _onNotificationTapped() {
    setState(() {
      _hasNewNotification = false; // ✅ Remove red dot when opened
    });
    Navigator.pushNamed(context, AppRoutes.notifications);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.home);
              },
              child: Image.asset('assets/images/logo_raw.jpg', height: 40),
            ),
            const SizedBox(width: 10),
          ],
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white),
                onPressed: _onNotificationTapped,
              ),
              if (_hasNewNotification) // ✅ Show red dot if there's a new event
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.profile);
            },
          ),
        ],
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blue.shade300,
        currentIndex: widget.selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Time-Table"),
          BottomNavigationBarItem(icon: Icon(Icons.campaign), label: "Announcements"),
        ],
      ),
    );
  }
}
