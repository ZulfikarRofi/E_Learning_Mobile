import 'dart:convert';
import 'package:first_app/model/mata_pelajaran.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String baseUrl = 'http://192.168.3.104:8000/api';

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

  Future<List<MataPelajaran>> getMataPelajaran(id) async {
    final response =
        await client.get(Uri.parse("$baseUrl/getMatapelajaran/$id"));
    if (response.statusCode == 200) {
      return mapelFromJson(response.body);
    } else {
      return List<MataPelajaran>.empty();
    }
  }
}
