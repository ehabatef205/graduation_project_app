import 'package:flutter/material.dart';
import 'package:graduation_project_app/home/departments.dart';
import 'package:graduation_project_app/login/get_id_screen.dart';
import 'package:graduation_project_app/login/login_screen.dart';
import 'package:graduation_project_app/home/home_screen.dart';
import 'package:graduation_project_app/splash/splash_sceen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}