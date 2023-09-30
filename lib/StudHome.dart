import 'package:flutter/material.dart';

class HomepageUser extends StatefulWidget {
  const HomepageUser({Key? key});

  @override
  State<HomepageUser> createState() => _HomepageUserState();
}

class _HomepageUserState extends State<HomepageUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            pinned: true,
            primary: false,
            expandedHeight: 230,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            backgroundColor: const Color.fromRGBO(38, 52, 53, 1),
            flexibleSpace: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: const Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "Hello User",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Good Morning...!",
                      style: TextStyle(
                        fontSize: 17,
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
                              child: const TextField(minLines: 1,maxLines: 5,
                                decoration: InputDecoration(
                                  filled: true,
                                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16), // Adjust the padding here

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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 5,
              (context, index) => SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color:Color.fromRGBO(247, 243, 240, 1),
                        borderRadius: BorderRadius.circular(20)),
                    height: 170,
                    width: 340,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Sessions",
                              style: TextStyle(fontFamily: 'Alegreya',
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),  const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Check your driving \n sessions here",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(minimumSize: const Size(120, 50),            backgroundColor: const Color.fromRGBO(38, 52, 53, 1),
foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                              ),
                                onPressed: () {}, child: const Text("Check Now"))
                          ],
                        ),Container(height: 129,width: 107,
                          child: const Image(image: AssetImage("images/Sessions.png"),fit: BoxFit.cover,))
                      ],
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
