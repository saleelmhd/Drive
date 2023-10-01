import 'package:flutter/material.dart';

class MystudentsAll extends StatefulWidget {
  const MystudentsAll({super.key});

  @override
  State<MystudentsAll> createState() => _MystudentsAllState();
}

class _MystudentsAllState extends State<MystudentsAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
       
          Expanded(
              child: ListView.separated(
            itemCount: 3,
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 224, 220, 217),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shibin Farhan",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              height: 16,
                              width: 16,
                              child:
                                  Image(image: AssetImage("images/note.png"))),
                          Text(
                            " 10 Question",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w300),
                          ),
                        ],
                      )
                    ],
                  ),
                  CircleAvatar(radius: 10,
                    child: Icon(Icons.arrow_forward,size: 12,),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  )
                ],
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
          )),
        ],
      ),
    );
  }
}
