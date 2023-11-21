import 'dart:convert';
import 'dart:io';

import 'package:drive_/CONNECTION/connection.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class UpdateStud extends StatefulWidget {
  var uid;
  UpdateStud({super.key, required this.uid});

  @override
  State<UpdateStud> createState() => _UpdateStudState();
}

class _UpdateStudState extends State<UpdateStud> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController joinDateController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  var email;
  var password;
  var vehicletypee;
  int flag = 0;
  var res;
  Future<void> _refresh() async {
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {});
  }

  Future<void> viewStudDetails() async {
    var data = {'uid': widget.uid.toString()};
    var response =
        await post(Uri.parse('${Con.url}/viewStudupdate.php'), body: data);

    print(response.statusCode);

    var res = jsonDecode(response.body);
    print('.....${data}.......');
    print(res);
    if (res[0]["result"] == 'Success') {
      setState(() {
        // Assuming 'data' is a Map containing student details
        //  var data = res['data'];
        nameController.text = res[0]['name'];
        addressController.text = res[0]['address'];
        ageController.text =
            res[0]['Age'].toString(); // Assuming age is an integer
        genderController.text = res[0]['gender'].toString();
        joinDateController.text = res[0]['joineddate'].toString();
        phoneNumberController.text = res[0]['phone'].toString();
        mailController.text = res[0]['email'];
        email = res[0]['email'];
        password = res[0]['password'];
        vehicletypee=res[0]['selected_veh'];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.uid);
    setState(() {
      viewStudDetails();
    });
  }
 
   File? _image;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      bool confirm = await _showConfirmationDialog(pickedFile.path);

      if (confirm) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    }
  }

  Future<bool> _showConfirmationDialog(String imagePath) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.file(File(imagePath),),
              SizedBox(height: 16),
              Text('Do you want to pick this image?'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // User does not confirm
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // User confirms
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    ) ?? false; // Return false if the user dismisses the dialog
  }



 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Update Student",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
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
                  height: 10,
                ),
                 Stack(
                  children: [
                    CircleAvatar(
                      radius: 81,
                      backgroundColor: Colors.white,
                    ),
                   _image == null
                ? CircleAvatar(
                    radius: 70.0,
                    child: Icon(Icons.person, size: 80.0),
                  )
                : CircleAvatar(
                    radius: 70.0,
                    backgroundImage: FileImage(_image!),
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
                            child: InkWell(onTap: () {
                                              _getImage(); // Open the image picker

                            },
                              child: Icon(
                                Icons.edit,
                                size: 17,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.0, bottom: 5),
                  child: Text(
                    "Email : ${email}",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Text(
                    "Pass : ${password}",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: nameController,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: const Color.fromRGBO(247, 248, 249, 1),
                    hintText: 'Name',
                  ),
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: addressController,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: const Color.fromRGBO(247, 248, 249, 1),
                    hintText: 'Address',
                  ),
                  keyboardType: TextInputType.name,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: TextFormField(
                            controller: ageController,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor: const Color.fromRGBO(247, 248, 249, 1),
                              hintText: 'Age',
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          child: TextFormField(
                            controller: genderController,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor: const Color.fromRGBO(247, 248, 249, 1),
                              hintText: 'gender',
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          child: TextFormField(
                            controller: joinDateController,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor: const Color.fromRGBO(247, 248, 249, 1),
                              hintText: 'Join Date',
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                      ),
                      //         Expanded(
                      //           child: SizedBox(
                      //             width: MediaQuery.of(context).size.width / 2,
                      //             child:  DropdownButtonFormField<String>(
                      //   borderRadius: BorderRadius.circular(20),
                      //   value: _selected,
                      //   items: _sex.map((String gender) {
                      //     return DropdownMenuItem<String>(
                      //       value: gender,
                      //       child: Text(gender),
                      //     );
                      //   }).toList(),
                      //   onChanged: (String? newValue) {
                      //     setState(() {
                      //       _selected = newValue;
                      //     });
                      //   },
                      //   decoration: InputDecoration(

                      //     hintText: "Sex",
                      //     border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10)), // Add a border
                      //   ),
                      // ),
                      //           ),
                      //         ),
                    ],
                  ),
                ),
                TextFormField(
                  controller: phoneNumberController,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: const Color.fromRGBO(247, 248, 249, 1),
                    hintText: 'Phone Number',
                  ),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(247, 248, 249, 1),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${vehicletypee}",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                // child: DropdownButtonFormField(
                //   borderRadius: BorderRadius.circular(20),
                //   value: _selectedVehicle,
                //   items: _vehicles.map((String veh) {
                //     return DropdownMenuItem<String>(
                //       value: veh,
                //       child: Text(veh),
                //     );
                //   }).toList(),
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       _selectedVehicle = newValue;
                //     });
                //   },
                //   decoration: InputDecoration(
                //     hintText: "Two Wheeler",
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //   ),
                // ),

                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    viewStudDetails();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width, 50),
                    backgroundColor: const Color.fromRGBO(38, 52, 53, 1),
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  child: const Text("UPDATE"),
                ),
              ],
            ),
          ),
        ));
  }
}
