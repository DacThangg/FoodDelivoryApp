import 'package:flutter/material.dart';
import 'package:fooddelivoryapp/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Food Delivery UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
        primaryColor: Colors.deepOrangeAccent,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepOrangeAccent, // Đặt màu chủ đạo cho AppBar
        ),
      ),
      home: HomeScreen(),
    );
  }
}


