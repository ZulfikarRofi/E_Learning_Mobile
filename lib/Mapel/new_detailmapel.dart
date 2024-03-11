import 'dart:convert';

import 'package:first_app/api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class DetailMapel extends StatefulWidget {
  final String? id;
  const DetailMapel({Key? key, this.id}) : super(key: key);

  @override
  _DetailMapelPage createState() => _DetailMapelPage(id: id);
}

class _DetailMapelPage extends State<DetailMapel> {
  final String? id;
  String? namaModul;
  var isiMateri = """""";
  _DetailMapelPage({this.id});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService().getWhereData('/getDetailMateri', id!),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> dataMateri = json.decode(snapshot.data!);
          namaModul = dataMateri['data']['nama_modul'];
          isiMateri = dataMateri['data']['deskripsi'];
          print(dataMateri);
          return Scaffold(
            appBar: AppBar(
                title: Row(children: [
              Flexible(
                child: Text(
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 20),
                    namaModul!),
              ),
            ])),
            body: SingleChildScrollView(
                child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Html(data: isiMateri),
            )),
          );
        } else {
          return Text('Error: ${snapshot.error}');
        }
      }),
    );

    //
  }
}

class KontenMateri extends StatelessWidget {
  var isi;
  KontenMateri({this.isi});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Html(data: isi),
    );
  }
}
