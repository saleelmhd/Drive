import 'package:drive_/ADMIN/UpdateTutor.dart';
import 'package:flutter/material.dart';

class TutorsALL extends StatefulWidget {
  const TutorsALL({super.key});

  @override
  State<TutorsALL> createState() => _TutorsALLState();
}

class _TutorsALLState extends State<TutorsALL> {
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
                itemBuilder: (context, index) => Card(
                  elevation: 4,
                  child: Container(decoration: BoxDecoration(border: Border.all(width: 1)),
                    height: 100,
                    // decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    //   BoxShadow(
                    //       spreadRadius: 1,
                    //       blurRadius: 3,
                    //       blurStyle: BlurStyle.normal,
                    //       color: Colors.grey)
                    // ]),
                    child: ListTile(
                      trailing:  Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: GestureDetector(onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const UpdateTutor())),
                            child: const CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              child: Icon(
                                Icons.arrow_forward,
                                size: 17,
                              ),
                            ),
                          )),
                      contentPadding: const EdgeInsets.only(top: 5, left: 20),
                      leading: Container(
                        height: 72,
                        width: 72,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      title: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Text(
                              "Shibin Farhan",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  height: 16,
                                  width: 16,
                                  child: Image(
                                      image: AssetImage("images/note.png"))),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  " 10 Sessions",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.schedule,
                                size: 16,
                              ),
                              Text(
                                " 24-05-2023",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ],
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
