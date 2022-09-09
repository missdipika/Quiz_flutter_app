import 'package:flutter/material.dart';
import 'package:quizapp/mathematies_model.dart';

class MyContainer extends StatefulWidget {
  const MyContainer({
    Key? key,
    required this.text,
  }) : super();

  final String text;

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  bool _isChecked = false;
  // int val = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),

      // height: 50,
      // width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.red),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.text),
          Radio(
            groupValue: _isChecked,
            value: _isChecked,
            activeColor: Colors.green,
            onChanged: (bool? value) {
              setState(() {
                _isChecked = value!;
                print(value);
              });
            },
          ),
        ],
      )),
    );
  }
}
