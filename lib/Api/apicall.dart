import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../model/questions_response_model.dart';

class ApiProvider {
  static Future<List<Results>> getAllData() async {
    String url =
        'https://opentdb.com/api.php?amount=20&category=19&type=multiple';
    var resData;

    try {
      final response = await http.get(Uri.parse(url));
      log(response.body);

      if (response.statusCode == 200) {
        // resData = jsonDecode(response.body);
        var data= resData["results"] as List;
        List<Results> datas = [];
        for (int i = 0; i < data.length; i++) {
          resData = Results.fromJson(resData["results"]);
          datas.add(resData);
        }
        return datas;
      }
      print(response.body);
      print("*****************************************************");
      print(resData);

      print('Response Data : ' + resData);
    } catch (e) {
      print(e);
    }
    return resData;
  }
}
