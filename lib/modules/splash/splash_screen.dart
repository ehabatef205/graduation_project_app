import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graduation_project_app/layout/app_layout.dart';
import 'package:graduation_project_app/layout/cubit/cubit.dart';
import 'package:graduation_project_app/modules/logIn/logIn_screen.dart';
import 'package:graduation_project_app/modules/splash/password.dart';
import 'package:graduation_project_app/shared/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      if (token == null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PasswordScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage("assets/logo.png"),
        ),
      ),
    );
  }
}
