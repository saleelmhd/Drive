import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginnAdmin extends StatefulWidget {
  const LoginnAdmin({super.key});

  @override
  State<LoginnAdmin> createState() => _LoginnAdminState();
}
bool _isPasswordVisible = false;

class _LoginnAdminState extends State<LoginnAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 15),
            child:Container(height: 24,width: 24,
              child: Image(image: AssetImage("images/sessionblack.png"),height: 24,width: 24,))
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
        padding: const EdgeInsets.only(left: 20, top: 20,right: 20),
        child: ListView(children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            "ISS COLLEGE\nDRIVING SCHOOL",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: const Color.fromRGBO(247, 248, 249, 1),
              hintText: 'Enter Your ID',
           
            ),
            keyboardType: TextInputType.emailAddress,
          ), const SizedBox(
            height: 20,
          ),
           TextFormField(obscureText: !_isPasswordVisible 
      ,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: const Color.fromRGBO(247, 248, 249, 1),
              hintText: 'Enter Your Password',
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
          ), const SizedBox(
            height: 70,
          ),
           ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width, 50),
              backgroundColor: const Color.fromRGBO(38, 52, 53, 1),
              foregroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            child: const Text("Login"),
          ), 
        
        ]),
      ),
    );
  }
}