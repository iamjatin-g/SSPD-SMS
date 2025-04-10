import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../widgets/base_screen.dart';
import '../widgets/custom_header.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 0,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom Header
              const CustomHeader(title: "Attendance"),

              const SizedBox(height: 10),

              // **"My Attendance" Title**
              const Center(
                child: Text(
                  "My Attendance",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 10),

              // **Attendance Legend**
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLegendBox(Colors.blue, "Present"),
                  const SizedBox(width: 15),
                  _buildLegendBox(Colors.red, "Leave"),
                  const SizedBox(width: 15),
                  _buildLegendBox(Colors.yellow, "Holiday"),
                ],
              ),

              const SizedBox(height: 10),

              // **Fixed Calendar Widget (No Swipe Up/Down)**
              SizedBox(
                height: 400,
                child: TableCalendar(
                  focusedDay: _focusedDay,
                  firstDay: DateTime(2000),
                  lastDay: DateTime(2100),
                  calendarFormat: CalendarFormat.month,
                  availableCalendarFormats: const {
                    CalendarFormat.month: 'Month',
                  },
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // **Widget for Legend Boxes**
  Widget _buildLegendBox(Color color, String text) {
    return Row(
      children: [
        Container(width: 16, height: 16, color: color),
        const SizedBox(width: 5),
        Text(text),
      ],
    );
  }
}

// // **Function to Get Month Name**
//   String _getMonthName(int month) {
//     const months = [
//       "", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
//     ];
//     return months[month];
//   }

  // // **Function to Get Weekday Name**
  // String _getWeekdayName(int weekday) {
  //   const weekdays = ["", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  //   return weekdays[weekday];
  // }

