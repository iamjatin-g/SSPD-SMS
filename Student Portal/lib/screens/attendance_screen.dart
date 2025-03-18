import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../widgets/base_screen.dart';
import '../widgets/back_button_widget.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 0, // Assuming Attendance is in index 1
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // **Header with Back Button**
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackButtonWidget(),
                const Text(
                  "Attendance",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 48), // To balance the alignment
              ],
            ),

            const SizedBox(height: 10),

            // **Date Display**
            Center(
              child: Text(
                "${_focusedDay.day} ${_getMonthName(_focusedDay.month)} ${_focusedDay.year} | ${_getWeekdayName(_focusedDay.weekday)}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            // **Student Info**
            const Text("Standard : 5th", style: TextStyle(fontSize: 16)),
            const Text("Division: A", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 15),

            // **Student Name**
            const Center(
              child: Text(
                "Student Name",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const Divider(thickness: 1),

            // **"My Attendance" Title**
            const Center(
              child: Text(
                "My Attendance",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            // **Attendance Legend (Present, Leave, Holiday)**
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

            // **Calendar Widget**
            TableCalendar(
              focusedDay: _focusedDay,
              firstDay: DateTime(2000),
              lastDay: DateTime(2100),
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                selectedDecoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // **Function to Get Month Name**
  String _getMonthName(int month) {
    const months = [
      "", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];
    return months[month];
  }

  // **Function to Get Weekday Name**
  String _getWeekdayName(int weekday) {
    const weekdays = ["", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    return weekdays[weekday];
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
