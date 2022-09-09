import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quizapp/Api/apicall.dart';
import 'package:quizapp/model/questions_response_model.dart';
import 'package:quizapp/question_page.dart';
import 'ScienceQuestion.dart';
import 'buttomscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int selectBottomNav = 0;
int selectedBox = 0;

class _HomeScreenState extends State<HomeScreen> {
  final List<String> isText = [
    'Mathematics',
    'Science',
    'Drama',
    'Art & Craft',
    'knowledge',
    'Language',
  ];
  final List<IconData> isIcon = [
    Icons.signal_cellular_connected_no_internet_0_bar_rounded,
    Icons.science_rounded,
    Icons.people,
    Icons.drive_file_rename_outline_sharp,
    Icons.menu_book_outlined,
    Icons.note_alt_outlined,
  ];

  @override
  void initState() {
    ApiProvider.getAllData();
    super.initState();
  }

  // ApiProvider ? getData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Stack(children: [
        Container(
          height: 210,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
        ),
        Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow,
                        image: DecorationImage(
                            image: AssetImage(
                              "images/profile.png",
                            ),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  const Text("Jonathan Smith",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              Container(
                  height: 220,
                  width: 550,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            image: const DecorationImage(
                                image: AssetImage(
                                  "images/questionmark.jpeg",
                                ),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            )),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "play &\nWin",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Text("De Finibus Bonorum et\nMalorum for use",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                              )),
                        ],
                      ),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Top Quiz Categorieds",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    child: Text(
                      'view all',
                      style: TextStyle(fontSize: 13.0, color: Colors.lightBlue),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.lightBlue.shade200,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              gridView(),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 60,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    selectBottomNav = 0;
                  });
                },
                child: NavItem(
                  isActive: selectBottomNav == 0 ? true : false,
                  icon: Icons.home,
                  text: "Home",
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectBottomNav = 1;
                  });
                },
                child: NavItem(
                    isActive: selectBottomNav == 1 ? true : false,
                    icon: Icons.notifications,
                    text: "notification"),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectBottomNav = 2;
                  });
                },
                child: NavItem(
                    isActive: selectBottomNav == 2 ? true : false,
                    icon: Icons.money_off_rounded,
                    text: "money"),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectBottomNav = 3;
                  });
                },
                child: NavItem(
                    isActive: selectBottomNav == 3 ? true : false,
                    icon: Icons.menu,
                    text: "menu"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget gridView() {
    return GridView.builder(
        itemCount: 6,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 18,
            childAspectRatio: 0.85),
        itemBuilder: (BuildContext context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                selectedBox = index;
              });
              if (index == 0) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyQuestion(results: Results())));
              }
              if (index == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScienceQuestion()));
              }
              if (index == 2) {
                ApiProvider.getAllData();
              }
            },
            child: Container(
              // height: 80,
              // width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    isIcon[index],
                    size: 35,
                  ),
                  Text(isText[index]),
                ],
              ),
            ),
          );
        });
  }
}
