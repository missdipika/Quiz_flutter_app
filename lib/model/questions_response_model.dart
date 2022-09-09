// class ResponseModel {
  // int? responseCode;
  // List<Results>? results;

  // ResponseModel({this.responseCode, this.results});

  // ResponseModel.fromJson(Map<String, dynamic> json) {
  //   responseCode = json['response_code'];
  //   print(responseCode);
  //   if (json['results'] != null) {
  //     results = <Results>[];
  //     json['results'].forEach((v) {
  //       results!.add(Results.fromJson(v));
  //     });
  //   }
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['response_code'] = this.responseCode;
  //   if (this.results != null) {
  //     data['results'] = this.results!.map((v) => v.toJson()).toList();
  //     print(results);
  //   }
  //   return data;
  // }
// }

class Results {
  String? question;
  String? correctAnswer;
  List<String>? incorrectAnswers;

  Results({this.question, this.correctAnswer, this.incorrectAnswers});

  Results.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    correctAnswer = json['correct_answer'];
    incorrectAnswers = json['incorrect_answers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['question'] = this.question;
    data['correct_answer'] = this.correctAnswer;
    data['incorrect_answers'] = this.incorrectAnswers;
    return data;
  }
}
