import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/base_screen.dart';
import '../widgets/back_button_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _stdDivController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _fatherContactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 0, // Profile screen should not affect bottom nav selection
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // Back Button & Centered Title
              Row(
                children: const [
                  BackButtonWidget(),
                  Expanded(
                    child: Center(
                      child: Text(
                        "My Profile",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(width: 48), // Keeps title centered
                ],
              ),

              const SizedBox(height: 20),

              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, size: 60, color: Colors.white),
                ),
              ),

              const SizedBox(height: 20),

              // Name Field
              _buildTextField(label: "Name", controller: _nameController),

              // DOB Field
              _buildTextField(
                label: "DOB (DD/MM/YYYY)",
                controller: _dobController,
                inputType: TextInputType.datetime,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"\d|/"))],
              ),

              // Email Field
              _buildTextField(label: "E-mail", controller: _emailController, inputType: TextInputType.emailAddress),

              // Contact Number Field
              _buildTextField(
                label: "Contact No.",
                controller: _contactController,
                inputType: TextInputType.phone,
                maxLength: 10,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),

              // Std & Div Field
              _buildTextField(label: "Std & Div", controller: _stdDivController),

              // Father's Name Field
              _buildTextField(label: "Father's Name", controller: _fatherNameController),

              // Father's Contact Number Field
              _buildTextField(
                label: "Father's Contact No.",
                controller: _fatherContactController,
                inputType: TextInputType.phone,
                maxLength: 10,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to Create a Text Field
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType inputType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    int? maxLength,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          counterText: "", // Hide character counter when maxLength is used
        ),
      ),
    );
  }
}
