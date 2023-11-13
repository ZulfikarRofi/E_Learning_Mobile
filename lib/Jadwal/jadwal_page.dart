import 'dart:convert';

import 'package:first_app/Mapel/detail_task.dart';
import 'package:first_app/api/api.dart';
import 'package:first_app/model/daily_task.dart';
import 'package:first_app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JadwalPage extends StatefulWidget {
  const JadwalPage({Key? key}) : super(key: key);

  @override
  _JadwalPageState createState() => _JadwalPageState();
}

class _JadwalPageState extends State<JadwalPage> {
  int currentIndex = 0;
  String name = '';
  String id = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    if (localStorage.getString("id") != null) {
      setState(() {
        var sessUser = localStorage.getString("user");
        var dat = jsonDecode(sessUser.toString());
        User user = User.fromJson(dat[0]);
        id = localStorage.getString("id")!;
        name = user.name.toString();
        print('nomor = ' + id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                      'Mata Pelajaran'),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 30),
                child: MyDateWidget(),
              ),
              FutureBuilder<List<Dailytask>>(
                future: ApiService().getDailytaskSiswa(id),
                builder: (context, AsyncSnapshot<List<Dailytask>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // While the future is still running
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    // If an error occurred while fetching the data
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    // If no data is available or the data list is empty
                    return const Text('No data available');
                  } else {
                    print(snapshot.data!);
                    // If data is available, you can build your UI using the data from the snapshot
                    List<Dailytask> dailytask = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        Dailytask data = dailytask[index];

                        return AllTask(
                          idTugas: data.id.toString(),
                          namaMapel: data.nama_mapel,
                          namaGuru: data.nama_guru,
                          jamAwal: data.jam_masuk,
                          jamAkhir: data.jam_akhir,
                          namaTugas: data.nama_tugas,
                        );
                      },
                      itemCount: dailytask.length,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyDateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14),
              width: 120,
              height: 150,
              padding: const EdgeInsets.only(
                  top: 30, bottom: 30, left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(children: [
                Text(
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    'SEN'),
                Text(
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                    '16')
              ]),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14),
              width: 120,
              height: 150,
              padding: const EdgeInsets.only(
                  top: 30, bottom: 30, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(50, 50, 50, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: const Column(children: [
                Text(
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    'SEL'),
                Text(
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                    '16')
              ]),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14),
              width: 120,
              height: 150,
              padding: const EdgeInsets.only(
                  top: 30, bottom: 30, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10)),
              child: const Column(children: [
                Text(
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    'RAB'),
                Text(
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                    '17')
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14),
              width: 120,
              height: 150,
              padding: const EdgeInsets.only(
                  top: 30, bottom: 30, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10)),
              child: const Column(children: [
                Text(
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    'KAM'),
                Text(
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                    '18')
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14),
              width: 120,
              height: 150,
              padding: const EdgeInsets.only(
                  top: 30, bottom: 30, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10)),
              child: const Column(children: [
                Text(
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    'JUM'),
                Text(
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                    '19')
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14),
              width: 120,
              height: 150,
              padding: const EdgeInsets.only(
                  top: 30, bottom: 30, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10)),
              child: const Column(children: [
                Text(
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    'SAB'),
                Text(
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                    '20')
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14),
              width: 120,
              height: 150,
              padding: const EdgeInsets.only(
                  top: 30, bottom: 30, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10)),
              child: const Column(children: [
                Text(
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    'MIN'),
                Text(
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                    '21')
              ]),
            )
          ],
        ));
  }
}

class AllTask extends StatelessWidget {
  final String? idTugas, namaGuru, namaMapel, jamAwal, jamAkhir, namaTugas;
  const AllTask(
      {Key,
      key,
      this.idTugas,
      this.jamAwal,
      this.jamAkhir,
      this.namaMapel,
      this.namaGuru,
      this.namaTugas})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
          overlayColor: MaterialStatePropertyAll(Colors.transparent)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailTask(idTugas: idTugas),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        padding: const EdgeInsets.only(bottom: 10),
        height: 100,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(right: 10),
              child: Column(
                children: [
                  Text(
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black),
                    jamAwal!,
                    // '08:00'
                  ),
                  const Spacer(),
                  Text(
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black),
                      jamAkhir!
                      // '10:30'
                      )
                ],
              ),
            ),
            Container(
              width: 297,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 151, 167, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  SizedBox(
                    width: 12,
                    height: 100,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 125, 145, 1),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                    ),
                  ),
                  Container(
                      width: 285,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      child: Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                                namaTugas!
                                // 'Tugas 1: Tugas Matematika 1'
                                ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                    child: Image.asset(
                                        'assets/images/teacherr.png'),
                                  ),
                                  Text(
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 10,
                                          color: Colors.black),
                                      namaGuru!
                                      // 'Bu Andriyani,S.Pd.'
                                      )
                                ],
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
