import 'dart:convert';

import 'package:http/http.dart' as http;

var link = "https://smp1ngetos-elearning.site/api/getQuizQuestions/1";

getQuiz() async {
  var res = await http.get(Uri.parse(link));
  if (res.statusCode == 200) {
    var data = jsonDecode(res.body.toString());
    print("data is loaded${data}");
    return data;
  }
}
