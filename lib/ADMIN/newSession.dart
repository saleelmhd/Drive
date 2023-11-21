import 'dart:convert';

import 'package:drive_/CONNECTION/connection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class NewSession extends StatefulWidget {
  const NewSession({super.key});

  @override
  State<NewSession> createState() => _NewSessionState();
}

class _NewSessionState extends State<NewSession> {
  DateTime? _selectedDate;
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  final DateTime _minDate = DateTime(2020, 1, 1);
  final DateTime _maxDate = DateTime.now();
  DateTime selectedTime = DateTime.now();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  Future<void> _showTimePicker(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedTime),
    );

    if (picked != null) {
      setState(() {
        selectedTime = DateTime(
          selectedTime.year,
          selectedTime.month,
          selectedTime.day,
          picked.hour,
          picked.minute,
        );
        timeController.text = '${selectedTime.hour}:${selectedTime.minute}';
      });
    }
  }

  String? _selectedStudent;

  String? _selectedTutor;

  String? selected_VehicleType;

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Add a GlobalKey for the form

  var name_flag;
  var Liststud = [];
  Future<void> viewSt() async {
    var response = await post(Uri.parse('${Con.url}/viewnewSessionStud.php'));
    print(response.body);

    if (response.statusCode == 200 &&
        jsonDecode(response.body)[0]['result'] == 'Success') {
      name_flag = 1;
      var package = jsonDecode(response.body);
      print('*********************************************');
      print('stud is = $package');

      setState(() {
        Liststud = package
            .map((Liststud) => {
                  'id': Liststud['user_id'],
                  'name': Liststud['name'],
                })
            .toList();
      });
      print('*********************************************');

      print('stud is = $Liststud');
      // return jsonDecode(response.body);
    }
    // else
    //   drop_flag=0;
    // drop_flag==1?      item=jsonDecode(response.body):item.add('Nothing to show');
  }

  var name_flag1;
  var ListTut = [];
  Future<void> viewTut() async {
    var response = await post(Uri.parse('${Con.url}/viewnewSessionTut.php'));
    print(response.body);

    if (response.statusCode == 200 &&
        jsonDecode(response.body)[0]['result'] == 'Success') {
      name_flag1 = 1;
      var tutors = jsonDecode(response.body);
      print('*********************************************');
      print('tutor is = $tutors');

      setState(() {
        ListTut = tutors
            .map((ListTut) => {
                  'id': ListTut['user_id'],
                  'name': ListTut['name'],
                })
            .toList();
      });
      print('*********************************************');

      print('Liststud is = $Liststud');
      // return jsonDecode(response.body);
    }
    // else
    //   drop_flag=0;
    // drop_flag==1?      item=jsonDecode(response.body):item.add('Nothing to show');
  }

  var name_flag2;
  var ListData = [];
  Future<void> viewPackage() async {
    var response = await post(Uri.parse('${Con.url}/viewpackage.php'));
    print(response.body);

    if (response.statusCode == 200 &&
        jsonDecode(response.body)[0]['result'] == 'Success') {
      name_flag = 1;
      var package = jsonDecode(response.body);
      print('*********************************************');
      print('package is = $package');

      setState(() {
        ListData = package
            .map((listItem) => {
                  'id': listItem['id'],
                  'name': listItem['pname'],
                  'price': listItem['price'],
                  'duration': listItem['duration'],
                })
            .toList();
      });
      print('*********************************************');

      print('ListData is = $ListData');
      // return jsonDecode(response.body);
    }
    // else
    //   drop_flag=0;
    // drop_flag==1?      item=jsonDecode(response.body):item.add('Nothing to show');
  }

  @override
  void initState() {
    super.initState();
    viewSt();
    viewTut();
    viewPackage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        // Wrap your content in a Form widget
        key: _formKey, // Assign the form key
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
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
                      const Text("New Session",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      const SizedBox()
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Add New Session',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 15.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  color: const Color.fromRGBO(232, 234, 236, 1),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: DropdownButtonFormField<String>(
                  borderRadius: BorderRadius.circular(20),
                  value: _selectedStudent,
                  items: Liststud.map((student) {
                    return DropdownMenuItem<String>(
                      value: '${student['name']}',
                      child: Text('${student['name']}'),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedStudent = newValue;
                    });
                  },
                  decoration: InputDecoration(
                    // Optional: Add decoration for the form field
                    // labelText: 'Select a student', // Label text
                    hintText: "Select a student",
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(10)), // Add a border
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  color: const Color.fromRGBO(232, 234, 236, 1),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: DropdownButtonFormField<String>(
                  borderRadius: BorderRadius.circular(20),
                  value: _selectedTutor,
                  items: ListTut.map((Tutor) {
                    return DropdownMenuItem<String>(
                      value: '${Tutor['name']}',
                      child: Text('${Tutor['name']}'),
                    );
                  }).toList(),
                  onChanged: (String? newValuee) {
                    setState(() {
                      _selectedStudent = newValuee;
                    });
                  },
                  decoration: InputDecoration(
                    // Optional: Add decoration for the form field
                    // labelText: 'Select a student', // Label text
                    hintText: "Select Tutor",
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(10)), // Add a border
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: dateController,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.calendar_month),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: const Color.fromRGBO(232, 234, 236, 1),
                    hintText: 'Select Date',
                    hintStyle: GoogleFonts.urbanist(
                        fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please select a date';
                    }

                    final selectedDate = _dateFormat.parse(value);
                    if (selectedDate.isBefore(_minDate) ||
                        selectedDate.isAfter(_maxDate)) {
                      return 'Date must be between ${_dateFormat.format(_minDate)} and ${_dateFormat.format(_maxDate)}';
                    }

                    return null;
                  },
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate ?? _maxDate,
                      firstDate: _minDate,
                      lastDate: _maxDate,
                    );

                    if (picked != null && picked != _selectedDate) {
                      setState(() {
                        _selectedDate = picked;
                        dateController.text = _dateFormat.format(picked);
                      });
                    }
                  },
                ),
              ),
              const SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: timeController,
                  decoration: InputDecoration(
                    hintText: 'Select Time',
                    filled: true,
                    fillColor: const Color.fromRGBO(232, 234, 236, 1),
                    suffixIcon: const Icon(Icons.timelapse),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onTap: () {
                    _showTimePicker(context);
                  },
                ),
              ),
              const SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: DropdownButtonFormField<String>(
                  borderRadius: BorderRadius.circular(20),
                  value: selected_VehicleType,
                  items: ListData.map((VehicleType) {
                    return DropdownMenuItem<String>(
                      value: '${VehicleType['id']}',
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${VehicleType['name']}',
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Text(
                                '${VehicleType['duration']}',
                                style: const TextStyle(color: Colors.blue),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Text(
                                '${VehicleType['price']}',
                                style: const TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue1) {
                    setState(() {
                      selected_VehicleType = newValue1;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(232, 234, 236, 1),
                    // Optional: Add decoration for the form field
                    // labelText: 'Select a student', // Label text
                    hintText: "Vehicle type",
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(10)), // Add a border
                  ),
                ),
              ),
              const SizedBox(height: 50.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(width: 0.4),
                    minimumSize: Size(MediaQuery.of(context).size.width, 50),
                    backgroundColor: const Color.fromRGBO(37, 51, 52, 1),
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  child: const Text(
                    "Done",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
