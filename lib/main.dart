
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:drive_/ADMIN/HomapageAdmin.dart';
import 'package:drive_/ADMIN/QuestionBank.dart';
import 'package:drive_/ADMIN/Quiz.dart';
import 'package:drive_/ADMIN/Trial%20Appointments.dart';
import 'package:drive_/ADMIN/newSession.dart';
import 'package:drive_/STUDENTS/FORMSCREENS/login.dart';

import 'package:flutter/material.dart';

void main(){
  runApp( const MyApp());
  
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home:    AnimatedSplashScreen(
          splash: Image.asset(
            "Images/Welcome.jpg",
            fit: BoxFit.cover,
          ),
          nextScreen: Login(),
          splashTransition: SplashTransition.rotationTransition,
          duration: 5000,
          splashIconSize: 80,
        )
    );
  }
}