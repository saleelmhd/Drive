import 'package:drive_/ADMIN/AddStudent.dart';
import 'package:drive_/ADMIN/HomapageAdmin.dart';
import 'package:drive_/ADMIN/Students.dart';
import 'package:drive_/ADMIN/UpdateStud.dart';
import 'package:drive_/ADMIN/UpdateTutor.dart';
import 'package:drive_/FORMSCREENS/moduleScreen.dart';
import 'package:drive_/STUDENTS/drivingschoolquiz.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Module(),
      // home: DrivingSchoolQuiz(),

      //  AnimatedSplashScreen(
      //   splash: RichText(
      //     text: const TextSpan(
      //       children: [
      //         TextSpan(
      //           text: 'D',
      //           style: TextStyle(
      //               fontWeight: FontWeight.bold,
      //               color: Colors.black,
      //               fontSize: 50),
      //         ),
      //         TextSpan(
      //           text: 'rivo',
      //           style: TextStyle(
      //             fontSize: 45,
      //             color: Colors.black,
      //             decorationStyle: TextDecorationStyle.double,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      //   nextScreen: Login(),
      //   splashTransition: SplashTransition.rotationTransition,
      //   duration: 4000,
      //   splashIconSize: 80,
      // )
    );
  }
}
