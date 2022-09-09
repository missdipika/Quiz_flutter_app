import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quizapp/mathematies_model.dart';
//  import 'package:share_plus/share_plus.dart';

import 'main.dart';

class MyResult extends StatefulWidget {
  final int counter;
  const MyResult({Key? key, required this.counter}) : super(key: key);

  @override
  State<MyResult> createState() => _MyResultState();
}

class _MyResultState extends State<MyResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Quiz Result",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    children: [
                      Image(
                        image: AssetImage(
                          "images/images.jpg",
                        ),
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.27,
                      ),
                      Positioned(
                        left: 0,
                        top: MediaQuery.of(context).size.width * 0.08,
                        right: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.06,
                          height: MediaQuery.of(context).size.height * 0.06,
                          // margin: EdgeInsets.only(left: 92, top: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 4),
                            image: DecorationImage(
                              image: AssetImage(
                                "images/profile.png",
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "congratulation!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                      "consectetur adipiscing elit.Aenean euis\nbibendum laoreet",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "your score".toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      decorationStyle: TextDecorationStyle.solid,
                      letterSpacing: 5.0,

                      //  wordSpacing: 15.0,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RichText(
                    text: TextSpan(
                      text: widget.counter.toString(),
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: '/',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: Mathematics.length.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "earned coins".toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      decorationStyle: TextDecorationStyle.solid,
                      letterSpacing: 5.0,
                      // wordSpacing: 15.0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(
                          "images/jhkj.jpg",
                        ),
                        width: MediaQuery.of(context).size.width * 0.13,
                        height: MediaQuery.of(context).size.height * 0.11,
                      ),
                      Text(
                        (widget.counter * 5).toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  elevatedButton(),
                  colse(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget elevatedButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 60,
          width: 155,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ElevatedButton.icon(
            onPressed: () {
              // await Share.share("hello");
            },
            icon: const Icon(
              Icons.share,
              size: 18,
              color: Colors.black,
            ),
            label: const Text("Share Result",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black,
                )),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              primary: Colors.white,
            ),
          ),
        ),
        ElevatedButton(
          child: Text('Take New Quiz'),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              primary: Colors.lightBlueAccent,
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget colse() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.12,
      height: MediaQuery.of(context).size.height * 0.12,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: InkWell(
        onTap: () {
          // Navigator.of(context)
          //     .popUntil(ModalRoute.withName(HomeScreen()));
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        child: Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    );
  }
}
