import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/base_screen.dart';
import '../routes/app_routes.dart';

// 📌 Custom ClipPath for Better Curved Background
class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60); // 🔼 Increased curve height
    path.quadraticBezierTo(size.width / 2, size.height + 50, size.width, size.height - 70);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat('EEEE, MMM d, yyyy').format(DateTime.now());

    return BaseScreen(
      selectedIndex: 0, // ✅ Home is selected
      child: Column(
        children: [
          // 📌 Enlarged Background Image Section
          Stack(
            children: [
              ClipPath(
                clipper: CustomClipPath(),
                child: Image.asset(
                  'assets/images/school_bg.jpg', // ✅ Enlarged image
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),

              // 📌 "Hello Student" at Top (Bold & Readable)
              Positioned(
                top: 20, // 🔼 Position at the top-left
                left: 20,
                child: const Text(
                  "Hello Student",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    shadows: [
                      Shadow(color: Colors.white, blurRadius: 3), // ✅ Soft outline
                    ],
                  ),
                ),
              ),

              // 📌 Date at Original Position (Right)
              Positioned(
                bottom: 20, // ✅ Kept at the same place as before
                right: 20,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8), // ✅ Semi-transparent background
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    currentDate,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 5), // ✅ Space between header and menu

          // 📌 Clean Grid Menu Section
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12, // 🔼 More spacing for a clean look
              mainAxisSpacing: 12,
              childAspectRatio: 3 / 2,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildGridItem(context, "Attendance", Icons.check_circle_outline, AppRoutes.attendance),
                _buildGridItem(context, "Diary", Icons.menu_book, AppRoutes.diary),
                _buildGridItem(context, "Syllabus Tracker", Icons.track_changes, AppRoutes.syllabusTracker),
                _buildGridItem(context, "Test Record", Icons.assignment, AppRoutes.testRecord),
                _buildGridItem(context, "Exam Record", Icons.school, AppRoutes.exams),
                _buildGridItem(context, "Fees Record", Icons.payment, AppRoutes.feesRecord),
                _buildGridItem(context, "Events", Icons.event, AppRoutes.events),
                _buildGridItem(context, "Transport", Icons.directions_bus, AppRoutes.transport),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, String title, IconData icon, String route) {
    return GestureDetector(
      onTap: () {
        if (route.isNotEmpty) {
          Navigator.pushNamed(context, route);
        }
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), // 🔼 Slightly rounder
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 42, color: Colors.blue), // 🔼 Slightly larger icons
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
