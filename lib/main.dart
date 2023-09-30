
import 'package:drive_/Questionbank.dart';
import 'package:drive_/Trail%20Appointment.dart';
import 'package:drive_/drivingschool.dart';
import 'package:drive_/mydocuments.dart';
import 'package:drive_/packages.dart';
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
      home:TrailAppointment(

      ),
      //splashScreen
    );
  }
}