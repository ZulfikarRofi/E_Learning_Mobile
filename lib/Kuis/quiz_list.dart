import 'dart:convert';

import 'package:first_app/api/api.dart';
import 'package:flutter/material.dart';

class QuizList extends StatefulWidget {
  const QuizList({Key? key}) : super(key: key);
  
  @override
  _QuizListState createState() => _QuizListState();
}

class _QuizListState extends State<QuizList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Column(children: [
          const Row(
            children: [
              Text(
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  'Daftar Kuis')
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: AllQuiz(),
          )
        ]),
      )),
    );
  }
}

class AllQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Column(children: [
        FutureBuilder(
          future: ApiService().getWhereData('/get', id!),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> dat = jsonDecode(snapshot.data!);
              print(dat);
              if (dat['id'] == null) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                      style: TextStyle(fontWeight: FontWeight.w600),
                      'Tidak ada tugas yang belum dikerjakan'),
                );
              } else {
                return MyQuiz(
                  namaKuis: dat['nama_tugas'],
                  namaKelas: dat['nama_kelas'],
                  namaMapel: dat['nama_mapel'],
                  tanggalAkhir: dat['duedate'],
                );
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        //Looping
      ]),
    ]);
  }
}

class MyQuiz extends StatelessWidget {
  final String? namaKuis, namaKelas, namaMapel, tanggalAkhir;
  const MyQuiz({
    Key,
    key,
    this.namaKuis,
    this.namaKelas,
    this.namaMapel,
    this.tanggalAkhir,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/quiz_page');
        },
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: Container(
          width: 340,
          height: 80,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.pink[200], borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 10,
                    height: 10,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 10,
                    height: 10,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  )
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset('assets/images/pen.png'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 14),
                            softWrap: false,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            'Kuis 1 : Phytagoras'),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                fontSize: 12),
                            'Matematika Kelas VII B')
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 10),
                            textAlign: TextAlign.right,
                            softWrap: false,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            'Kam, 18 Mei 2023'),
                        Text(
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 10),
                            textAlign: TextAlign.right,
                            'Belum Dikerjakan')
                      ],
                    ),
                  )
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  SizedBox(
                    width: 10,
                    height: 10,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 10,
                    height: 10,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
