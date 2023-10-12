// ignore_for_file: must_be_immutable

import 'package:drive_/STUDENTS/StudHome.dart';
import 'package:drive_/TUTOR/TutorHome.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginn extends StatefulWidget {
  var type;
    Loginn({super.key,required this.type});
  @override
  State<Loginn> createState() => _LoginnState();
}

bool _isPasswordVisible = false;

class _LoginnState extends State<Loginn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 15),
            child: ElevatedButton(
              onPressed: () {},
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
        child: ListView(children: [
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
          TextFormField(
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
          TextFormField(
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
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: ((context) => const ForgetPassword())));
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
            height: 70,
          ),
          ElevatedButton(
            onPressed: () {

              switch(widget.type)
              {
                case "student":  Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomepagStud()));
                  break;
                  case "tutor":Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomePageTutor()));
                  break;
              }
            
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
          // Center(
          //   child: GestureDetector(
          //     onTap: () {
          //       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LoginnTutor()));
          //     },
          //     child: Text("Login as Tutor",
          //         style: GoogleFonts.urbanist(
          //           decoration: TextDecoration.underline,
          //           fontSize: 16,
          //        color: const Color.fromRGBO(38, 52, 53, 1),
          //           fontWeight: FontWeight.bold,
          //         )),
          //   ),
          // ),
          const SizedBox(height: 20,),
        ]),
      ),
    );
  }
}
