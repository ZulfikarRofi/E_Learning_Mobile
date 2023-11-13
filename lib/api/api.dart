import 'dart:convert';
import 'package:first_app/Chatbot/list_chatbot.dart';
import 'package:first_app/Kuis/quiz_list.dart';
import 'package:first_app/Kuis/quiz_page.dart';
import 'package:first_app/model/daily_task.dart';
import 'package:first_app/model/list_chatusers.dart';
import 'package:first_app/model/mata_pelajaran.dart';
import 'package:first_app/model/materi_mapel.dart';
import 'package:first_app/model/quiz_model.dart';
import 'package:first_app/model/selected_mapel.dart';
import 'package:first_app/model/tugas_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String baseUrl = 'http://192.168.74.65:8000/api';

  var token;

  Client client = Client();

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
      print(e);
      return 'failed';
    }
  }

  getWhere(apiUrl, String id) async {
    var fullUrl = baseUrl + apiUrl + "/" + id;
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  Future<String> getWhereData(apiUrl, String id) async {
    var fullUrl = baseUrl + apiUrl + "/" + id;
    http.Response response =
        await http.get(Uri.parse(fullUrl), headers: _setHeaders());
    try {
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return 'failed';
      }
    } catch (e) {
      print(e);
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
      return mapelFromJson(json.encode(body['data']));
    } else {
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
    final response = await client.get(Uri.parse("$baseUrl/getChatUsers/$id"));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return listChatUserFromJson(json.encode(body['data']));
    } else {
      return List<listChatUser>.empty();
    }
  }
}
