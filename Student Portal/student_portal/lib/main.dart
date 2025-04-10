import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart'; // 👈 Required for debugPaintSizeEnabled
import 'routes/app_routes.dart';

void main() {
  debugPaintSizeEnabled = false; // 👈 This highlights layout boundaries
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Portal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.login,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
