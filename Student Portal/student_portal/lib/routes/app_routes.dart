import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/home_screen.dart';
import '../screens/attendance_screen.dart';
import '../screens/exams_screen.dart';
import '../screens/timetable_screen.dart';
import '../screens/notifications_screen.dart';
import '../screens/announcements_screen.dart';
import '../screens/diary_screen.dart';
import '../screens/syllabus_tracker_screen.dart';
import '../screens/test_record_screen.dart';
import '../screens/fees_record_screen.dart';
import '../screens/events_screen.dart';
import '../screens/transport_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/assessment_screen.dart';
import '../screens/syllabus_details_screen.dart';
import '../screens/exam_timetable_screen.dart';
import '../screens/view_inbox_note_screen.dart';
import '../screens/add_note_screen.dart';
import '../screens/timetable_assessment_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';
  static const String attendance = '/attendance';
  static const String diary = '/diary';
  static const String syllabusTracker = '/syllabus-tracker';
  static const String testRecord = '/test-record';
  static const String exams = '/exams';
  static const String feesRecord = '/fees-record';
  static const String events = '/events';
  static const String transport = '/transport';
  static const String timeTable = '/timetable';
  static const String notifications = '/notifications';
  static const String announcements = '/announcements';
  static const String profile = '/profile';
  static const String assessment = '/assessment';
  static const String syllabusDetails = '/syllabus-details';
  static const String examTimetable = '/exam-timetable';
  static const String viewInboxNote = '/view-inbox-note';
  static const String addNote = '/add-note';
  static const String timetableAssessment = '/timetable-assessment';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
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
      case timeTable:
        return MaterialPageRoute(builder: (_) => const TimeTableScreen());
      case notifications:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      case announcements:
        return MaterialPageRoute(builder: (_) => const AnnouncementsScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case assessment:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => AssessmentScreen(),
          settings: RouteSettings(arguments: args), // ✅ Pass subject and chapter
        );
      case syllabusDetails:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => SyllabusDetailsScreen(),
          settings: RouteSettings(arguments: args),
        );
      case timetableAssessment:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => TimetableAssessmentScreen(),
          settings: RouteSettings(arguments: args), // ✅ Pass Subject Data
        );
      case examTimetable:
        return MaterialPageRoute(builder: (_) => const ExamTimetableScreen());
      case viewInboxNote:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ViewInboxNoteScreen(
            subject: args['subject'] ?? '',
            message: args['message'] ?? '',
            date: args['date'] ?? '',
          ),
        );
      case addNote: // Route for Add Note screen
        return MaterialPageRoute(builder: (_) => const AddNoteScreen());
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
