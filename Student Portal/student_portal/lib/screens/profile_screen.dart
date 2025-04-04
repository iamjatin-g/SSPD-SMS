import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/back_button_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<Map<String, String>> _profileData;

  @override
  void initState() {
    super.initState();
    _profileData = _fetchProfileData();
  }

  Future<Map<String, String>> _fetchProfileData() async {
    // await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

    return {
      "Name": "John Doe",
      "DOB": "01/01/2000",
      "E-mail": "johndoe@example.com",
      "Contact No.": "9876543210",
      "Std & Div": "10th - A",
      "Father's Name": "Michael Doe",
      "Father's Contact No.": "9876543211",
    };
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<Map<String, String>>(
                future: _profileData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text("Failed to load profile"));
                  }

                  final data = snapshot.data!;
                  return ListView(
                    children: [
                      _buildProfileAvatar(),
                      const SizedBox(height: 20),
                      ...data.entries.map((entry) {
                        return _buildInfoField(label: entry.key, value: entry.value);
                      }).toList(),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            _buildLogoutButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: const [
        BackButtonWidget(goHome: true),
        Expanded(
          child: Center(
            child: Text(
              "My Profile",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(width: 48),
      ],
    );
  }

  Widget _buildProfileAvatar() {
    return const Center(
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.grey,
        child: Icon(Icons.person, size: 60, color: Colors.white),
      ),
    );
  }

  Widget _buildInfoField({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        controller: TextEditingController(text: value),
        readOnly: true,
      ),
    );
  }

  Widget _buildLogoutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Implement logout logic here
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text("Logout", style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
