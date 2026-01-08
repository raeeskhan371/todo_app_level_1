import 'package:flutter/material.dart';
import 'package:todo_app_level_1/Screen/Add_Screen.dart';
import 'package:todo_app_level_1/Screen/Home_Screen.dart';
import 'package:todo_app_level_1/Screen/Splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}

