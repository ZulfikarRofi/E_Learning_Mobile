import 'dart:convert';

import 'package:first_app/api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailTask extends StatefulWidget {
  final String? idTugas;
  const DetailTask({Key? key, this.idTugas}) : super(key: key);

  @override
  _DetailTaskPage createState() => _DetailTaskPage(idTugas: idTugas);
}

class _DetailTaskPage extends State<DetailTask> {
  String? idTugas, namaTugas, namaMapel, namaKelas, namaGuru, tanggalAkhir;
  var deskripsiTugas = """""";
  _DetailTaskPage({this.idTugas});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                border: Border.all(
                    color: const Color.fromARGB(255, 214, 214, 214),
                    width: 1.0)),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/beranda');
              },
              child: const Icon(color: Colors.black, Icons.arrow_back),
            )),
      ),
      body: FutureBuilder(
          future: ApiService().getWhereData('/getDetailTugas', idTugas!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              print(snapshot.data);
              Map<String, dynamic> dataTugas = json.decode(snapshot.data!);
              namaTugas = dataTugas['data'][0]['nama_tugas'];
              namaMapel = dataTugas['data'][0]['nama_mapel'];
              namaKelas = dataTugas['data'][0]['nama_kelas'];
              namaGuru = dataTugas['data'][0]['nama_guru'];
              deskripsiTugas = dataTugas['data'][0]['deskripsi_tugas'];
              tanggalAkhir = dataTugas['data'][0]['due_date'];
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        Text(
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 28),
                            'Detail Tugas'),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: Container(
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(252, 218, 149, 1)),
                            child: Image.asset(
                                height: 80,
                                width: 80,
                                'assets/images/pen.png')),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 14),
                        width: 264.0,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 24),
                                // 'Tugas Aljabar Dasar'
                                namaTugas!),
                            Text(
                                style: const TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 16),
                                // 'Matematika IX-A'
                                namaMapel! + " " + namaKelas!)
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    width: 500.0,
                    height: 300.0,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.grey),
                              'Tentang Tugas :'),
                          Html(data: deskripsiTugas),
                        ],
                      ),
                    ),
                  ),
                  TaskCompletionWidget(
                      namaGuru: namaGuru,
                      namaKelas: namaKelas,
                      namaMapel: namaMapel,
                      tanggalAkhir: tanggalAkhir),
                ]),
              );
            } else {
              return Text('Error: ${snapshot.error}');
            }
          }),
    );
  }
}

class TaskCompletionWidget extends StatelessWidget {
  String? namaGuru, namaKelas, namaMapel, tanggalAkhir;
  TaskCompletionWidget(
      {Key,
      key,
      this.namaGuru,
      this.namaKelas,
      this.namaMapel,
      this.tanggalAkhir})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          children: [
            Container(
                // margin: const EdgeInsets.only(top: 10),
                width: 344,
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.grey, width: 1.0))),
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                child: const Text(
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.grey),
                    'Pengajar')),
          ],
        ),
        Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 165, 15, 4),
                  borderRadius: BorderRadius.circular(35)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset('assets/images/murid.png'),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14),
                      // 'Andriyani,S.Pd.'
                      namaGuru!),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                      // 'Guru Matematika IX-A'
                      "Guru " + namaMapel! + " " + namaKelas!),
                ),
              ],
            )
          ],
        ),
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.grey),
                  'Batas Pengerjaan'),
            )
          ],
        ),
        Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        color: Colors.black),
                    // 'Selasa, 17 November 2023'
                    tanggalAkhir!)),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          width: 340,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10)),
          child: TextButton(
            onPressed: () {},
            child: const Text(
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.white),
                'Tugas Selesai'),
          ),
        ),
      ]),
    );
  }
}
