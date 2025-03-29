import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl =
      "http://10.0.2.2:3000"; // ✅ For Android Emulator

  static Future<Map<String, dynamic>> login(
    String username,
    String password,
  ) async {
    try {
      final response = await http.post(
        Uri.parse("$_baseUrl/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"username": username, "password": password}),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {
          "success": false,
          "message":
              jsonDecode(response.body)["message"] ?? "Invalid credentials",
        };
      }
    } on FormatException {
      return {"success": false, "message": "Invalid response from server"};
    } on http.ClientException {
      return {"success": false, "message": "Network error, check connection"};
    } catch (e) {
      return {"success": false, "message": "Unexpected error: ${e.toString()}"};
    }
  }
}
