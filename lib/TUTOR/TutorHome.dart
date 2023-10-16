
import 'package:drive_/TUTOR/Mydoc.dart';
import 'package:drive_/TUTOR/Tutormysessions.dart';
import 'package:drive_/TUTOR/modelTutorHome.dart';
import 'package:drive_/TUTOR/mystudents.dart';
import 'package:flutter/material.dart';

class HomePageTutor extends StatefulWidget {
   const HomePageTutor({super.key});

  @override
  State<HomePageTutor> createState() => _HomePageTutorState();
}

class _HomePageTutorState extends State<HomePageTutor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            pinned: true,
            expandedHeight: 190,
            toolbarHeight: 190,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            backgroundColor: const Color.fromRGBO(38, 52, 53, 1),
            flexibleSpace: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "Hello User",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Good Morning...!",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const TextField(
                                minLines: 1,
                                maxLines: 5,
                                decoration: InputDecoration(
                                  filled: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal:
                                          16), // Adjust the padding here

                                  fillColor:
                                      Color.fromRGBO(255, 255, 255, 0.68),
                                  hintText: 'Search Services',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.search, color: Colors.white),
                          onPressed: () {
                            // Handle search button pressed here
                            // You can add your search functionality here
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: tutorHome.length,
                (context, index) => SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(247, 243, 240, 1),
                          borderRadius: BorderRadius.circular(20)),
                      height: 170,
                      width: 340,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 34,
                                width: 144,
                                child: Text(
                                  "${tutorHome[index]["Title"]}",
                                  style: const TextStyle(
                                      fontFamily: 'Alegreya',
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: 36,
                                width: 170,
                                child: Text(
                                  "${tutorHome[index]["Subtitle"]}",
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(120, 40),
                                      backgroundColor:
                                          const Color.fromRGBO(38, 52, 53, 1),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {
                                    
                                    switch (index) {
                                      case 0:
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const MyStudents()));
                                        break;
                                      case 1:
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const TutorMysessions()));
                                        break;
                                      case 2:
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const MyDocTutor()));
                                        break;
                                    }
                                  },
                                  child: const Row(
                                    children: [
                                      Text("Check Now"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      CircleAvatar(
                                        radius: 8,
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.black,
                                        child: Icon(
                                          Icons.arrow_forward,
                                          size: 11,
                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                          SizedBox(
                              height: 115,
                              width: 110,
                              child: Image(
                                image:
                                    AssetImage("${tutorHome[index]["Image"]}"),
                                fit: BoxFit.cover,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
