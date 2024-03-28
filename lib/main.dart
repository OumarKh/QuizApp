import 'package:flutter/material.dart';
import 'package:quiz_app/screens/home_screen.dart'; // Import your TestScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        bottomSheetTheme: 
        const BottomSheetThemeData(backgroundColor: Colors.transparent),
      ),
      home: HomePage(), // Navigate to the test screen
    );
  }
}