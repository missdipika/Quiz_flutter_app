import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quizapp/mathematies_model.dart';
import 'package:quizapp/container.dart';
import 'package:quizapp/model/questions_response_model.dart';
import 'package:quizapp/result_screen.dart';

import 'Api/apicall.dart';
import 'main.dart';

class MyQuestion extends StatefulWidget {
  final Results results;
  MyQuestion({
    Key? key,
    required this.results,
  }) : super(key: key);

  @override
  State<MyQuestion> createState() => _MyQuestionState();
}

class _MyQuestionState extends State<MyQuestion> {
  // bool _isChecked = false;
  int selectedIndex = 0;
  PageController controller = PageController();
  late bool isLoading;
  String? gr;
  String? anw;
  String value = "ans1";
  int counter = 0;

  int index = 0;
  var datas;
  // ApiProvider? apiProvider;
  void getDataProcess() async {
    isLoading = true;
    // datas = await apiProvider!.getAllData();
    ApiProvider.getAllData().then((value) {
      print("...........................${value.toString()}");
    });
    // .whenComplete(() {
    //   print("...........................${datas.toString()}");
    //   isLoading = true;
    //   setState(() {});
    // });
  }

  @override
  void initState() {
    print("hello");
    // print(widget.results.question);
    getDataProcess();
    // Mathematics.shuffle();
    // print(Mathematics);
    super.initState();
    // getDataProcess.then((value) {
    //   setState(() {});
    // }).whenComplete(() {
    //   setState(() {
    //     isLoading = false;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            const Text(
              "Mathematics Quiz",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            index < 9
                ? Text(
                    "Question 0${index + 1}/${Mathematics.length}",
                    style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                : Text(
                    "Question ${index + 1}/${Mathematics.length}",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                Mathematics.length,
                (index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      width: 15,
                      height: 3,
                      decoration: BoxDecoration(
                        color:
                            selectedIndex == index ? Colors.green : Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            ),
            Spacer(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: PageView.builder(
                itemCount: Mathematics.length,

                physics: NeverScrollableScrollPhysics(),
                controller: controller,

                // scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  setState(() {
                    selectedIndex = value;
                    index = value;
                    gr = null;
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    // height: MediaQuery.of(context).size.height * 0.8,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          // widget.results.question!,
                          "",

                          //  Mathematics[index].question,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: Mathematics[index].option.length,
                            itemBuilder: (context, i) {
                              // Mathematics[index].option.shuffle();
                              return Container(
                                decoration: BoxDecoration(
                                    border: gr == Mathematics[index].option[i]
                                        ? Border.all(
                                            color: Colors.green,
                                            width: 1,
                                          )
                                        : Border.all(
                                            color: Colors.grey,
                                            width: 1,
                                          ),
                                    color: Colors.black.withOpacity(0.03),
                                    borderRadius: BorderRadius.circular(20)),
                                margin: const EdgeInsets.all(6.0),
                                child: RadioListTile(
                                  activeColor: Colors.green,
                                  // tileColor: Colors.pink,
                                  selectedTileColor: Colors.green,

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                  title: Text(
                                    Mathematics[index].option[i],
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                  value: Mathematics[index].option[i],
                                  groupValue: gr,
                                  onChanged: (String? value) {
                                    setState(() {
                                      gr = value!;
                                      Mathematics[index].answer;
                                      if (Mathematics[index].answer == value) {
                                        counter++;
                                      }
                                    });
                                  },
                                ),
                              );
                            }),
                      ],
                    ),
                  );
                },

                //  children: [
                //    for (int i = 0; i < Mathematics.length; i++)

                // ],
              ),
            ),
            Spacer(),
            elevatedButton(),
          ],
        ),
      ),
    );
  }

  Widget elevatedButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 54,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ElevatedButton.icon(
            onPressed: () {
              showAlertDialog(context);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            icon: const Icon(
              Icons.power_settings_new_rounded,
              size: 18,
            ),
            label: const Text("Quit Quiz",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.white,
                )),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              primary: Colors.black,
            ),
          ),
        ),
        index + 1 == Mathematics.length
            ? ElevatedButton(
                child: Text('Submit'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyResult(
                                counter: counter,
                              )));
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    primary: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 20),
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              )
            : ElevatedButton(
                child: Text('Next'),
                onPressed: () {
                  gr != null
                      ?
                      // controller.animateToPage(page: , duration: Duration(milliseconds: 500), curve: Curves.bounceInOut);
                      controller.nextPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeIn)
                      : null;
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    primary: gr != null ? Colors.lightBlueAccent : Colors.grey,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 20),
                    textStyle: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold)),
              ),
      ],
    );
  }

  showAlertDialog(BuildContext context) {
    Widget cancel = TextButton(
      child: Text("No",
          style: TextStyle(
            color: Colors.blue,
          )),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        "yes",
        style: TextStyle(color: Colors.blue),
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyResult(
                      counter: counter,
                    )));
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text(
        "Logout",
        style: TextStyle(color: Colors.blue),
      ),
      content: Text(
        "Are You Sure,do You Want to logout?",
        style: TextStyle(color: Colors.blue),
      ),
      actions: [
        cancel,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
