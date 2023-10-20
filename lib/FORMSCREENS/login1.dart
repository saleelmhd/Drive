// ignore_for_file: must_be_immutable, use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'dart:math';

import 'package:drive_/CONNECTION/connection.dart';
import 'package:drive_/FORMSCREENS/forgetPassword.dart';
import 'package:drive_/STUDENTS/StudHome.dart';
import 'package:drive_/TUTOR/TutorHome.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class Loginn extends StatefulWidget {
  var type;
  Loginn({super.key, required this.type});
  @override
  State<Loginn> createState() => _LoginnState();
}

bool _isPasswordVisible = false;

class _LoginnState extends State<Loginn> {
  TextEditingController idController = TextEditingController();
    TextEditingController passcontrol = TextEditingController();


  int _randomID = 0;

  void generateRandomID() {
    setState(() {
      final random = Random();
      _randomID =
          random.nextInt(90000) + 10000; // Generates a random 5-digit number
      idController.text = _randomID.toString();
    });
  }
   Future<void> login() async {
    var data = {
      'name': idController.text,
     'password':passcontrol.text,
      'type': widget.type,
    };
    print(data);
    var response =
        await post(Uri.parse('${Con.url}/registration.php'), body: data);
    print(response.statusCode);
    print(response.body);
    var res = jsonDecode(response.body);
    // final namekeyy = _namekey.currentState!.validate();
    // final agekeyy = _ageKey.currentState!.validate();
    // final mailkeyy = _mailKey.currentState!.validate();
    // final numberkeyy = _numberKey.currentState!.validate();

    if (res["result"] == 'Success'
    //  &&
    //     namekeyy &&
    //     agekeyy &&
    //     mailkeyy &&
    //     numberkeyy
        )
         {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          content: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check, color: Colors.white),
              SizedBox(width: 10),
              Text(
                'Login Successfully',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          elevation: 4.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          duration: const Duration(seconds: 3),
        ),
      );
      switch (widget.type) {
                  case "student":
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomepagStud()));
                    break;
                  case "tutor":
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomePageTutor()));
                    break;
                }
      idController.clear();
     

      // if (jsonDecode(response.body)['result'] == 'Success') {
      //   ScaffoldMessenger.of(context)
      //       .showSnackBar(SnackBar(content: Text('Registered Successfully',style: TextStyle(color: Colors.red),)));
      //   Navigator.pop(context);
      // } else {
      //   ScaffoldMessenger.of(context)
      //       .showSnackBar(SnackBar(content: Text('Registration Failed')));
      //   Navigator.pop(context);
      // }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 15),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomepagStud()));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: const Color.fromRGBO(38, 52, 53, 1),
                foregroundColor: Colors.white,
              ),
              child: const Text("Skip"),
            ),
          )
        ],
        foregroundColor: Colors.black,
        leading: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white30),
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.keyboard_arrow_left,
                  size: 30,
                )),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 50,
            ),
            Text("Think about safety \n first! Then drive...",
                style: GoogleFonts.urbanist(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                )),
            const SizedBox(
              height: 50,
            ),
            const Text('Your Login ID:'),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 50,
                width: 100,
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(left: 25)),
                  controller: idController,
                  readOnly: true,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(50, 50), backgroundColor: Colors.black),
                  onPressed: generateRandomID,
                  child: const Text('Generate ID'),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: idController,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: const Color.fromRGBO(247, 248, 249, 1),
                hintText: 'Enter Your ID',
                hintStyle: GoogleFonts.urbanist(
                    fontSize: 15, fontWeight: FontWeight.w300),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              child: TextFormField(controller: passcontrol,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  filled: true,
                  fillColor: const Color.fromRGBO(247, 248, 249, 1),
                  hintText: 'Enter Your Password',
                  hintStyle: GoogleFonts.urbanist(
                      fontSize: 15, fontWeight: FontWeight.w300),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => ForgetPassword(
                                type: widget.type,
                              ))));
                    },
                    child: Text(
                      "Forget Password ?",
                      style: GoogleFonts.urbanist(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    )),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                 login() ;
               
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width, 50),
                backgroundColor: const Color.fromRGBO(38, 52, 53, 1),
                foregroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              child: Text(
                "Login",
                style: (GoogleFonts.urbanist(
                    fontSize: 15, fontWeight: FontWeight.w600)),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}
