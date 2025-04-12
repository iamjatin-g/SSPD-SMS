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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20), // More balanced padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom Header
              const CustomHeader(title: "Attendance"),

              const SizedBox(height: 20), // Adjusted for better spacing

              // **"My Attendance" Title**
              const Center(
                child: Text(
                  "My Attendance",
                  style: TextStyle(
                    fontSize: 22, // Larger font for emphasis
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent, // Consistent color with app theme
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // **Attendance Legend**
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLegendBox(Colors.blue, "Present"),
                  const SizedBox(width: 25),
                  _buildLegendBox(Colors.red, "Leave"),
                  const SizedBox(width: 25),
                  _buildLegendBox(Colors.yellow, "Holiday"),
                ],
              ),

              const SizedBox(height: 20),

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
                      fontSize: 18, // Larger font size for calendar header
                      fontWeight: FontWeight.w600, // Bold title
                      color: Colors.blueAccent,
                    ),
                  ),
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Colors.blue.shade400,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.red.shade400,
                      shape: BoxShape.circle,
                    ),
                    weekendTextStyle: const TextStyle(color: Colors.red), // Highlight weekends
                    defaultTextStyle: const TextStyle(color: Colors.black),
                    outsideTextStyle: const TextStyle(color: Colors.grey),
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
        Container(
          width: 18, // Adjusted size for better balance
          height: 18,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500, // Subtle font weight
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
