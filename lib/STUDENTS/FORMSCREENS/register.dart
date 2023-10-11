import 'dart:convert';

import 'package:drive_/STUDENTS/FORMSCREENS/CONNECTION/connection.dart';
import 'package:drive_/STUDENTS/StudHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class Reg extends StatefulWidget {
  const Reg({super.key});

  @override
  State<Reg> createState() => _RegState();
}
 String? _selected;

  List<String> _sex = [
    'Male',
    'Female',
    'Other',
    // Add more as needed
  ];

class _RegState extends State<Reg> {
  var name = TextEditingController();
  var age = TextEditingController();
  var sex = TextEditingController();
  var mail = TextEditingController();
  var phone = TextEditingController();
  final formkey = GlobalKey<FormState>();

  Future<void> register() async {
    var data = {
      'name': name.text,
      'age': age.text,
      'sex': sex.text,
      'email': mail.text,
      'phone': phone.text,
    };
      var response =
          await post(Uri.parse('${Con.url}/registration.php'), body: data);
      print(response.body);
      jsonDecode(response.body);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Stack(
                  children: [
                    CircleAvatar(
                      radius: 81,
                      backgroundColor: Colors.white,
                    ),
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage("images/profilepic.png"),
                    ),
                    Positioned(
                        right: 0,
                        top: 40,
                        child: CircleAvatar(
                          radius: 20,
                        )),
                    Positioned(
                        right: 0,
                        top: 40,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            foregroundColor: Colors.white,
                            radius: 17,
                            backgroundColor: Color.fromRGBO(38, 52, 53, 1),
                            child: Icon(
                              Icons.edit,
                              size: 17,
                            ),
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: const Color.fromRGBO(247, 248, 249, 1),
                    hintText: 'Enter Your Name',
                    hintStyle: GoogleFonts.urbanist(
                        fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                  keyboardType: TextInputType.name,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextFormField(
                          controller: age,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: const Color.fromRGBO(247, 248, 249, 1),
                            hintText: 'Age',
                            hintStyle: GoogleFonts.urbanist(
                                fontSize: 15, fontWeight: FontWeight.w300),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2)
                          ],
                          onChanged: (value) {
                            if (value.length == 10) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child:  DropdownButtonFormField<String>(
                borderRadius: BorderRadius.circular(20),
                value: _selected,
                items: _sex.map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selected = newValue;
                  });
                },
                decoration: InputDecoration(
                 
                  hintText: "Sex",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)), // Add a border
                ),
              ),
                        ),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  controller: mail,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: const Color.fromRGBO(247, 248, 249, 1),
                    hintText: 'Mail',
                    hintStyle: GoogleFonts.urbanist(
                        fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: TextFormField(
                    controller: phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: const Color.fromRGBO(247, 248, 249, 1),
                      hintText: 'Phone Number',
                      hintStyle: GoogleFonts.urbanist(
                          fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    onChanged: (value) {
                      if (value.length == 10) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                          print(name.text);
                            print(phone.text);
                            print(mail.text);
                             print(age.text);
                              print(sex.text);
                              
                           register();
                           
                    



                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomepagStud()));
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
                    "Submit",
                    style: (GoogleFonts.urbanist(
                        fontSize: 15, fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
