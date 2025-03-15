import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/attendance_screen.dart';
import '../screens/exams_screen.dart';
import '../screens/calendar_screen.dart';
import '../screens/notifications_screen.dart';
import '../screens/diary_screen.dart';
import '../screens/syllabus_tracker_screen.dart';
import '../screens/test_record_screen.dart';
import '../screens/fees_record_screen.dart';
import '../screens/events_screen.dart';
import '../screens/transport_screen.dart';
import '../screens/profile_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String attendance = '/attendance';
  static const String diary = '/diary';
  static const String syllabusTracker = '/syllabus-tracker';
  static const String testRecord = '/test-record';
  static const String exams = '/exams';
  static const String feesRecord = '/fees-record';
  static const String events = '/events';
  static const String transport = '/transport';
  static const String calendar = '/calendar';
  static const String notifications = '/notifications';
  static const String profile = '/profile'; //

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case attendance:
        return MaterialPageRoute(builder: (_) => const AttendanceScreen());
      case diary:
        return MaterialPageRoute(builder: (_) => const DiaryScreen());
      case syllabusTracker:
        return MaterialPageRoute(builder: (_) => const SyllabusTrackerScreen());
      case testRecord:
        return MaterialPageRoute(builder: (_) => const TestRecordScreen());
      case exams:
        return MaterialPageRoute(builder: (_) => const ExamsScreen());
      case feesRecord:
        return MaterialPageRoute(builder: (_) => const FeesRecordScreen());
      case events:
        return MaterialPageRoute(builder: (_) => const EventsScreen());
      case transport:
        return MaterialPageRoute(builder: (_) => const TransportScreen());
      case calendar:
        return MaterialPageRoute(builder: (_) => const CalendarScreen());
      case notifications:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(
                "404: Page Not Found",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
    }
  }
}
