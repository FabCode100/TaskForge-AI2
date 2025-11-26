import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(TaskForgeApp());
}

class TaskForgeApp extends StatelessWidget {
  const TaskForgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TaskForge-AI",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black87,
        primaryColor: Colors.orange,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        colorScheme: ColorScheme.dark(
          primary: Colors.orange,
          secondary: Colors.orange,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[850],
          hintStyle: TextStyle(color: Colors.white54),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
