import 'package:drive_/driveqstns.dart';
import 'package:flutter/material.dart';

class DrivingSchoolQuiz extends StatefulWidget {
  const DrivingSchoolQuiz({
    super.key,
  });

  @override
  State<DrivingSchoolQuiz> createState() => _DrivingSchoolQuizState();
}

class _DrivingSchoolQuizState extends State<DrivingSchoolQuiz> {
  int _currentIndex = 0;
  final List<String> tabs = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  @override
  Widget build(
    BuildContext context,
  ) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(38, 52, 53, 1),
        body: Column(
          children: [
            SizedBox(
              height: 170,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
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
                            const Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text("Driving school",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17)),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          height: 26,
                          width: 76,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.schedule_outlined,
                                size: 20,
                              ),
                              Text(" 16:35")
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Expanded(
              child: DraggableScrollableSheet(
                  initialChildSize: 1,
                  maxChildSize: 1,
                  minChildSize: 1,
                  expand: false,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 4,
                            width: 50,
                            color: Colors.black,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                TabBar(
                                  // padding:  EdgeInsets.symmetric(horizontal: 35.0),
                                  tabAlignment: TabAlignment.start,
                                  indicator: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.black, // Indicator color
                                        width: 2.0, // Indicator thickness
                                      ),
                                    ),
                                  ),
                                  labelColor:
                                      Colors.white, // Selected tab text color
                                  unselectedLabelColor:
                                      Colors.white, // Unselected tab text color
                                  isScrollable: true,
                                  labelPadding: const EdgeInsets.symmetric(
                                      horizontal:
                                          5.0), // Padding for tab labels
                                  tabs: tabs
                                      .map(
                                        (tab) => Tab(
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: _currentIndex ==
                                                      tabs.indexOf(tab)
                                                  ? Colors
                                                      .black // Grey color for selected tab
                                                  : Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      50.0), // Rounded corners
                                              border: Border.all(
                                                  color: Colors
                                                      .transparent), // Divider color
                                            ),
                                            child: Center(
                                              child: Text(
                                                tab,
                                                style: const TextStyle(
                                                    fontSize: 16.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onTap: (index) {
                                    setState(() {
                                      _currentIndex = index;
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Container(
                                    height: 1, // Divider height below tabs
                                    color:
                                        Colors.grey, // Divider color below tabs
                                  ),
                                ),
                                const Expanded(
                                  child: TabBarView(children: [
                                    QestionSet1(),
                                    QestionSet1(),
                                    QestionSet1(),
                                    QestionSet1(),
                                    QestionSet1(),
                                    QestionSet1(),
                                    QestionSet1(),
                                    QestionSet1(),
                                    QestionSet1(),
                                    QestionSet1(),
                                  ]),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8,0,8,15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Icon(
                                    Icons.keyboard_arrow_left,
                                    color: Colors.white,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text("submit Quiz"),
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(195, 50),
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                      side: BorderSide(color: Colors.black)),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
