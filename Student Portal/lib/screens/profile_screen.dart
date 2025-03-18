import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../routes/app_routes.dart';
import '../widgets/base_screen.dart';
import '../widgets/back_button_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

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
      selectedIndex: 0, // ✅ Profile screen should not affect bottom nav selection
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                // ✅ Back Button & Centered Title
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

                // ✅ Name Field
                _buildTextField(
                  label: "Name",
                  controller: _nameController,
                  validator: (value) => value!.trim().isEmpty ? "Name cannot be empty" : null,
                ),

                // ✅ DOB Field
                _buildTextField(
                  label: "DOB (DD/MM/YYYY)",
                  controller: _dobController,
                  inputType: TextInputType.datetime,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r"\d|/")), // Allow numbers & "/"
                  ],
                  validator: (value) {
                    if (value!.trim().isEmpty) return "Date of Birth cannot be empty";
                    RegExp dateRegex = RegExp(r"^\d{2}/\d{2}/\d{4}$");
                    if (!dateRegex.hasMatch(value)) return "Enter a valid date (DD/MM/YYYY)";
                    return null;
                  },
                ),

                // ✅ Email Field
                _buildTextField(
                  label: "E-mail",
                  controller: _emailController,
                  inputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.trim().isEmpty) return "E-mail cannot be empty";
                    RegExp emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                    if (!emailRegex.hasMatch(value)) return "Enter a valid e-mail";
                    return null;
                  },
                ),

                // ✅ Contact Number Field
                _buildTextField(
                  label: "Contact No.",
                  controller: _contactController,
                  inputType: TextInputType.phone,
                  maxLength: 10,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Only numbers
                  validator: (value) {
                    if (value!.trim().isEmpty) return "Contact number cannot be empty";
                    if (value.length != 10) return "Contact number must be 10 digits";
                    return null;
                  },
                ),

                // ✅ Std & Div Field
                _buildTextField(
                  label: "Std & Div",
                  controller: _stdDivController,
                  validator: (value) => value!.trim().isEmpty ? "Standard & Division cannot be empty" : null,
                ),

                // ✅ Father's Name Field
                _buildTextField(
                  label: "Father's Name",
                  controller: _fatherNameController,
                  validator: (value) => value!.trim().isEmpty ? "Father's Name cannot be empty" : null,
                ),

                // ✅ Father's Contact Number Field
                _buildTextField(
                  label: "Father's Contact No.",
                  controller: _fatherContactController,
                  inputType: TextInputType.phone,
                  maxLength: 10,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value!.trim().isEmpty) return "Father's Contact number cannot be empty";
                    if (value.length != 10) return "Contact number must be 10 digits";
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // ✅ Submit Button
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text("Profile Saved Successfully!"),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Save Profile",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ✅ Function to Create a Text Field with Validation
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType inputType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    int? maxLength,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          counterText: "", // ✅ Hide character counter when maxLength is used
        ),
      ),
    );
  }
}
