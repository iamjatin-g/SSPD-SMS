import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/base_screen.dart';
import '../routes/app_routes.dart';

// 📌 Custom ClipPath for Curved Image
class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 50);
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
          // 📌 Curved Image Background Section
          Stack(
            children: [
              ClipPath(
                clipper: CustomClipPath(),
                child: Image.asset(
                  'assets/images/campus_building.jpg', // ✅ Load image from assets
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover, // ✅ Ensure the image fills the space
                ),
              ),
              Positioned(
                top: 50, // Adjust text position
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 📌 "Hello Student" with Black Text
                    const Text(
                      "Hello Student",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // ✅ Black text
                      ),
                    ),

                    // 📌 Date with Grey Background
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.grey[300], // ✅ Light grey background
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        currentDate,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // ✅ Black text for contrast
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20), // ✅ Space between header and menu

          // 📌 Grid Menu Section
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 2,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildGridItem(context, "Attendance", Icons.check_circle_outline, AppRoutes.attendance),
                _buildGridItem(context, "Diary", Icons.menu_book, ""),
                _buildGridItem(context, "Syllabus Tracker", Icons.track_changes, ""),
                _buildGridItem(context, "Test Record", Icons.assignment, ""),
                _buildGridItem(context, "Exam Record", Icons.school, AppRoutes.exams),
                _buildGridItem(context, "Fees Record", Icons.payment, ""),
                _buildGridItem(context, "Events", Icons.event, ""),
                _buildGridItem(context, "Transport", Icons.directions_bus, ""),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
