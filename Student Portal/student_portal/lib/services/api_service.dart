import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://10.0.2.2:3000"; // Update if using an emulator

  // Fetch Notifications from Backend
  static Future<List<Map<String, String>>> fetchNotifications() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/notifications"));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((item) =>
        {
          "id": item["id"].toString(),
          "title": item["title"].toString(),
          "description": item["description"].toString(),
          "date": item["date"].toString(),
        }).toList();
      } else {
        throw Exception("Failed to load notifications");
      }
    } catch (e) {
      print("Error fetching notifications: $e");
      return [];
    }
  }
}
