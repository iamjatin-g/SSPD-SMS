import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../services/api_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false; // ✅ Added loading state

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true); // ✅ Show loading state

      String username = _usernameController.text.trim();
      String password = _passwordController.text.trim();

      try {
        final response = await ApiService.login(username, password);

        if (response['success']) {
          Navigator.pushReplacementNamed(context, AppRoutes.home);
        } else {
          _showSnackBar(response['message']);
        }
      } catch (e) {
        _showSnackBar("Unable to connect to the server");
      }

      setState(() => _isLoading = false); // ✅ Hide loading state
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ✅ Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/background.jpg",
              fit: BoxFit.cover,
            ),
          ),

          // ✅ Logo in Top-Left Corner
          Positioned(
            top: 40,
            left: 20,
            child: Image.asset(
              "assets/images/logo_raw.jpg",
              width: 100,
            ),
          ),

          // ✅ Login Form
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "SSPD SMS",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _buildTextField(_usernameController, "Username"),
                        const SizedBox(height: 10),
                        _buildPasswordField(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // ✅ Login Button with Loading Indicator
                  _isLoading
                      ? const CircularProgressIndicator() // Show loading
                      : ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    ),
                    child: const Text(
                      "Log in",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, color: Colors.black)),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            filled: true,
            fillColor: Colors.white.withOpacity(0.2),
          ),
          validator: (value) => value!.isEmpty ? "Enter your $label" : null,
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Password", style: TextStyle(fontSize: 16, color: Colors.black)),
        const SizedBox(height: 5),
        TextFormField(
          controller: _passwordController,
          obscureText: !_isPasswordVisible,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            filled: true,
            fillColor: Colors.white.withOpacity(0.2),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
          ),
          validator: (value) => value!.isEmpty ? "Enter your Password" : null,
        ),
      ],
    );
  }
}
