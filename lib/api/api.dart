import 'dart:convert';

import 'package:first_app/data/question_example.dart';
import 'package:first_app/model/bot_options.dart';
import 'package:first_app/model/daily_task.dart';
import 'package:first_app/model/get_chats.dart';
import 'package:first_app/model/list_chatusers.dart';
import 'package:first_app/model/mata_pelajaran.dart';
import 'package:first_app/model/materi_mapel.dart';
import 'package:first_app/model/quiz_model.dart';
import 'package:first_app/model/ranking.dart';
import 'package:first_app/model/tugas_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String baseUrl = 'https://smp1ngetos-elearning.site/api';

  // ignore: prefer_typing_uninitialized_variables
  var token;

  Client client = Client();

  // ignore: unused_element
  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? tokenNullable = localStorage.getString('token');
    if (tokenNullable != null) {
      token = jsonDecode(tokenNullable)['token'];
    }
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer $token',
      };

  postData(data, apiUrl) async {
    var fullUrl = baseUrl + apiUrl;

    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    http.Response response = await http.get(Uri.parse(baseUrl + apiUrl));
    try {
      if (response.statusCode == 200) {
        return response;
      } else {
        return 'failed';
      }
    } catch (e) {
      return 'failed';
    }
  }

  getWhere(apiUrl, String id) async {
    var fullUrl = "${baseUrl + apiUrl}/$id";
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  Future<String> getWhereData(apiUrl, String id) async {
    var fullUrl = "${baseUrl + apiUrl}/$id";
    http.Response response =
        await http.get(Uri.parse(fullUrl), headers: _setHeaders());
    try {
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return 'failed';
      }
    } catch (e) {
      return 'failed';
    }
  }

  Future<MataPelajaran> getDetailMapel(id) async {
    final response = await client.get(Uri.parse("$baseUrl/getDetailMapel/$id"));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return MataPelajaran.fromJson(jsonData);
    } else {
      throw Exception('Failed to Load Data');
    }
  }

  Future<String> getDetailedMapel(String id) async {
    final response = await client.get(Uri.parse("$baseUrl/getDetailMapel/$id"));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed');
    }
  }

  Future<List<MataPelajaran>> getMataPelajaran(id) async {
    final response = await client.get(Uri.parse("$baseUrl/getMapelSiswa/$id"));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      // Check if 'data' exists and is a list in the response
      if (body['data'] is List) {
        List<dynamic> dataList = body['data'];
        // Map the list of 'data' to MataPelajaran objects using fromJson
        List<MataPelajaran> mataPelajaranList =
            dataList.map((data) => MataPelajaran.fromJson(data)).toList();
        return mataPelajaranList;
      } else {
        // Return an empty list if 'data' is not a list or is empty
        return List<MataPelajaran>.empty();
      }
    } else {
      // Handle other status codes (non-200)
      return List<MataPelajaran>.empty();
    }
  }

  Future<List<Task>> getTaskSiswa(id) async {
    final response = await client.get(Uri.parse("$baseUrl/getTugasSiswa/$id"));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return taskFromJson(json.encode(body['data']));
    } else {
      return List<Task>.empty();
    }
  }

  Future<List<Dailytask>> getDailytaskSiswa(id) async {
    final response = await client.get(Uri.parse("$baseUrl/getJadwalku/$id"));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return dailytaskFromJson(json.encode(body['data']));
    } else {
      return List<Dailytask>.empty();
    }
  }

  Future<List<QuizModel>> getKuisSiswa(id) async {
    final response = await client.get(Uri.parse("$baseUrl/getKuisSiswa/$id"));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return quizModelFromJson(json.encode(body['data']));
    } else {
      return List<QuizModel>.empty();
    }
  }

  Future<List<materiMapel>> getMateriMapel(id) async {
    final response = await client.get(Uri.parse("$baseUrl/getMateriMapel/$id"));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return materiMapelFromJson(json.encode(body['data']));
    } else {
      return List<materiMapel>.empty();
    }
  }

  Future<List<listChatUser>> listChat(id) async {
    final response = await client.get(Uri.parse("$baseUrl/getListChatbot/$id"));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return listChatUserFromJson(json.encode(body['data']));
    } else {
      return List<listChatUser>.empty();
    }
  }

  Future<List<Quiz>> fetchQuizData(id) async {
    final response = await http.get(Uri.parse("$baseUrl/getQuizQuestions/$id"));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      return List<Quiz>.from(
        parsed['data'].map((quizData) => Quiz.fromJson(quizData)),
      );
    } else {
      return List<Quiz>.empty();
    }
  }

  Future<List<Ranking>> quizRanking(id) async {
    final response = await client.get(Uri.parse("$baseUrl/getDataRanking/$id"));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return rankingFromJson(json.encode(body['data']));
    } else {
      return List<Ranking>.empty();
    }
  }

  Future<List<botOptions>> getBotOptions(id) async {
    final response = await client.get(Uri.parse("$baseUrl/getOptionsBot/$id"));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return botOptionsFromJson(json.encode(body['data']));
    } else {
      return List<botOptions>.empty();
    }
  }

  Future<List<getFillChats>> getChats() async {
    final response = await client.get(Uri.parse("$baseUrl/getBot"));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return getFillChatsFromJson(json.encode(body['data']));
    } else {
      return List<getFillChats>.empty();
    }
  }
}
