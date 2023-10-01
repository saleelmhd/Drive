import 'package:flutter/material.dart';

class VehicleALL extends StatefulWidget {
  const VehicleALL({super.key});

  @override
  State<VehicleALL> createState() => _VehicleALLState();
}

class _VehicleALLState extends State<VehicleALL> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                padding: const EdgeInsets.all(0),
                itemCount: 2,
                itemBuilder: (context, index) => Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color.fromARGB(31, 31, 17, 17)),
                        borderRadius: BorderRadius.circular(15)),

                    // decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    //   BoxShadow(
                    //       spreadRadius: 1,
                    //       blurRadius: 3,
                    //       blurStyle: BlurStyle.normal,
                    //       color: Colors.grey)
                    // ]),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      contentPadding: EdgeInsets.all(10),
                      title: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Maruthi 800",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "GLE AMG 2.0 Hybrid",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(Icons.star_outline),
                              Text(
                                "Tutor : Arun kumar",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(Icons.pin_drop_outlined),
                              Text(
                                "Branch : Perinthalmanna",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Container(
                        height: 110,
                        width: 145,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("images/maruthi.png"),
                          fit: BoxFit.cover,
                        )),
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
