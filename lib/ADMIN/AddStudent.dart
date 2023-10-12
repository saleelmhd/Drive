import 'package:flutter/material.dart';

class AddStud extends StatefulWidget {
  const AddStud({Key? key}) : super(key: key);

  @override
  State<AddStud> createState() => _AddStudState();
}

class _AddStudState extends State<AddStud> {
  String? _selectedVehicle;

  List<String> _vehicles = [
    '1 whealer',
    '2 whealer',
    '3 whealer',
    // Add more vehicles as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Add Student",
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
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.keyboard_arrow_left,
                size: 30,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            children: [
              const Stack(
                children: [
                  CircleAvatar(
                    radius: 76,
                    backgroundColor: Colors.white,
                  ),
                  CircleAvatar(
                    radius: 65,
                    backgroundImage: AssetImage("images/profilepic.png"),
                  ),
                  Positioned(
                    right: 0,
                    top: 40,
                    child: CircleAvatar(
                      radius: 20,
                    ),
                  ),
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
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(247, 248, 249, 1),
                  hintText: 'Name',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(247, 248, 249, 1),
                  hintText: 'Address',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: const Color.fromRGBO(247, 248, 249, 1),
                          hintText: 'Age',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: const Color.fromRGBO(247, 248, 249, 1),
                            hintText: 'Sex',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(247, 248, 249, 1),
                  hintText: 'Phone Number',
                ),
                keyboardType: TextInputType.phone,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: const Color.fromRGBO(247, 248, 249, 1),
                          hintText: 'Mail',
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: const Color.fromRGBO(247, 248, 249, 1),
                            hintText: 'Join Date',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(247, 248, 249, 1),
                ),
                child: DropdownButtonFormField<String>(
                  borderRadius: BorderRadius.circular(20),
                  value: _selectedVehicle,
                  items: _vehicles.map((String veh) {
                    return DropdownMenuItem<String>(
                      value: veh,
                      child: Text(veh),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedVehicle = newValue;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Heavy ,Two Wheeler",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
                child: Text("Submit".toUpperCase()),
              ),SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
