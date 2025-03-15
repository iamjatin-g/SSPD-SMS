import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 0, // ✅ Profile doesn't change bottom nav selection
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Title
            const Text(
              "My Profile",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // ✅ Profile Icon
            Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.person, size: 60, color: Colors.blue),
                  ),
                  const SizedBox(height: 10),
                  const Text("My Profile", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ✅ Form Fields
            _buildTextField("Name"),
            _buildTextField("DOB"),
            _buildTextField("E-mail"),
            _buildTextField("Contact no."),
            _buildTextField("Std & Div"),
            _buildTextField("Father's Name"),
            _buildTextField("Contact no."),

          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        ),
      ),
    );
  }
}
