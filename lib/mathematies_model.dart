import 'package:flutter/material.dart';

class MathQuestion {
  String question;
  List<String> option;
  String answer;
  // String option2;
  // String option3;
  // String option4;
  MathQuestion({
    required this.question,
    required this.option,
    required this.answer,
    // required this.option3,
    // required this.option4
  });
}

List<MathQuestion> Mathematics = [
  MathQuestion(
      question:
          "Which of the following multipliers will cause a number to be increased by 29.7%?",
      option: ["1.297", "13.0", "78.02", "none"],
      answer: "12.97"),
  MathQuestion(
      question:
          "Which of the  multipliers will cause a number to be increased by 29.7%?",
      option: ["1.297", "12.97", " 129.7", "130.2"],
      answer: "12.97"),
  MathQuestion(
    question: "The ratio 5 : 4 expressed as a percent equals",
    option: [
      "12.5%",
      "40%",
      "80%",
      "125%",
    ],
    answer: "80%",
  ),
  MathQuestion(
    question:
        "What percentage of numbers from 1 to 70 have squares that end in the digit 1?",
    option: ["1", "14", "17", "20"],
    answer: "17",
  ),
  MathQuestion(
      question:
          " Find the Missing Term in Multiples of 6 : 6, 12, 18, 24, _, 36, 42, _ 54, 60.",
      option: ["32, 45", "30,48", "24,40", "25,49"],
      answer: "30,48"),
  MathQuestion(
      question: "How Many Years are there in a Decade?",
      option: ["5years", "10years", "15years", "20years"],
      answer: "15years"),
  MathQuestion(
      question: "How Many Months Make a Century?",
      option: ["12", "120", "1200", "12000"],
      answer: "120"),
  MathQuestion(
      question:
          " Priya had 16 Red Balls, 2 Green Balls, 9  Blue Balls, and 1 Multicolor Ball. If He Lost 9 Red Balls, 1 Green Ball, and 3 Blue Balls. How Many Balls would be Left?",
      option: ["15", "11", "28", "39"],
      answer: "11"),
  MathQuestion(
      question: "What Number Comes Before 9019?",
      option: ["9099", "9091", "9109", "none of these"],
      answer: "9091"),
  MathQuestion(
      question: " What is the product of 121 x 0 x 20 x 2.5 - ",
      option: ["6050", "0", "2,420", "none of above"],
      answer: "0"),
  MathQuestion(
      question:
          " Look at this series: 36, 34, 30, 28, …, 22 What number should come to fill in the blank space",
      option: ["25", "24", "26", "none of above"],
      answer: "26"),
  MathQuestion(
      question:
          " 27 is a perfect cube. If true then what is the perfect cube of 27?",
      option: ["9", "6", "3", "2 is not a perfect cube"],
      answer: "3"),
  MathQuestion(
      question: " What is the product of 121 x 0 x 20 x 2.5 - ",
      option: ["6050", "0", "2,420", "none of the above"],
      answer: "60"),
  MathQuestion(
    question: "Which number is best represented in binary as 100? ",
    option: ["6", "0", "2", "4"],
    answer: "4",
  ),
  MathQuestion(
      question:
          "What 3 numbers result in the same answer when they are added or multiplied altogether? ",
      option: ["1", "2", "3", "1,2&3"],
      answer: "1,2&3"),
  MathQuestion(
      question: "Which number is best represented in binary as 100? ",
      option: ["1", "2", "3", "4"],
      answer: "4"),
  MathQuestion(
      question:
          "A man is currently 4 times older than his son. In 10 years, the man will be three times older than his son. What is the man’s age presently?",
      option: ["60", "40", "30", "80"],
      answer: "80"),
  MathQuestion(
      question:
          "A car is traveling at the rate of 75 kilometers per hour. How many meters is the car traveling in one minute? ",
      option: [
        "1250 meters per minute.",
        "1050 meters per minute.",
        "1320 meters per minute.",
        "1028 meters per minute."
      ],
      answer: "1250 meters per minute. "),
  MathQuestion(
      question:
          "Adding the numbers between 1 to 100 consecutively (1+2+3+4+…) gives you what final answer?",
      option: ["5050 ", "1290", "3219", "4952"],
      answer: "5050"),
  MathQuestion(
      question:
          "What is next in the following number series: 256, 289, 324, 361 . . . ?",
      option: ["600", "500", "400", "375"],
      answer: "400"),
];
