import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/attendance_screen.dart';
import '../screens/exams_screen.dart';
import '../screens/calendar_screen.dart';
import '../screens/notifications_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String attendance = '/attendance';
  static const String exams = '/exams';
  static const String calendar = '/calendar';
  static const String notifications = '/notifications';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case attendance:
        return MaterialPageRoute(builder: (_) => const AttendanceScreen());
      case exams:
        return MaterialPageRoute(builder: (_) => const ExamsScreen());
      case calendar:
        return MaterialPageRoute(builder: (_) => const CalendarScreen());
      case notifications:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("404: Page Not Found")),
          ),
        );
    }
  }
}
