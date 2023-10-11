import 'package:flutter/material.dart';

class UpdateStud extends StatefulWidget {
  const UpdateStud({super.key});

  @override
  State<UpdateStud> createState() => _UpdateStudState();
}

class _UpdateStudState extends State<UpdateStud> {
   String? _selected;

  List<String> _sex = [
    'Male',
    'Female',
    'Other',
    // Add more as needed
  ];
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
                const Padding(
                  padding: EdgeInsets.only(right: 20.0,bottom: 5),
                  child: Text(
                    "Id : PM64785",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right:20.0),
                  child: Text(
                    "Pass : MK0147258",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextFormField(
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
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: const Color.fromRGBO(247, 248, 249, 1),
                    hintText: 'Phone Number',
                  ),
                  keyboardType: TextInputType.name,
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
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: const Color.fromRGBO(247, 248, 249, 1),
                            hintText: 'Mail',
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: TextFormField(
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
                const SizedBox(
                  height: 20,
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
                  child: const Text("UPDATE"),
                ),
              ],
            ),
          ),
        ));
  }
}
