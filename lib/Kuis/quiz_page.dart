import 'dart:convert';

import 'package:first_app/Kuis/components/quizpage_background.dart';
import 'package:first_app/Kuis/quiz_fill.dart';
import 'package:first_app/api/api.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  final String? idKuis;
  const Quiz({Key? key, this.idKuis}) : super(key: key);

  @override
  _QuizPage createState() => _QuizPage(idKuis: idKuis);
}

class _QuizPage extends State<Quiz> {
  String? idKuis, namaKuis, duedate, namaKelas, namaMapel;
  _QuizPage({this.idKuis});

  @override
  void initState() {
    super.initState();
    getDataKuis();
  }

  getDataKuis() async {
    if (idKuis != null) {
      final data = await ApiService().getWhereData('/getDetailKuis', idKuis!);
      Map<String, dynamic> dataKuis = json.decode(data);
      print(idKuis);
      print(dataKuis);
      setState(() {
        namaKuis = dataKuis['data']['nama_kuis'];
        namaMapel = dataKuis['data']['nama_mapel'];
        namaKelas = dataKuis['data']['nama_kelas'];
        // print(namaMapel);
      });
    }
    // print(namaMapel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            children: [
              Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromARGB(255, 214, 214, 214),
                          width: 1.0)),
                  child: TextButton(
                    onPressed: () {},
                    child: const Icon(color: Colors.black, Icons.arrow_back),
                  )),
            ],
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              QuizpageBackground(),
              FutureBuilder(
                  future: getDataKuis(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              padding: EdgeInsets.all(10),
                              width: 350,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 5,
                                      offset: const Offset(0, 5),
                                    )
                                  ]),
                              child: Flexible(
                                child: Column(
                                  children: [
                                    Text(
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                        // 'Quiz 1 - Matematika'
                                        "Kuis - " + namaMapel!),
                                    Text(
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300),
                                        // 'Topik : Aljabar',
                                        namaKuis!),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30, right: 30, left: 30),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              Image.asset(
                                                  'assets/images/question.png'),
                                              const Text(
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14),
                                                  '10 Soal'),
                                              const Text(
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 12),
                                                  'Total Soal')
                                            ],
                                          ),
                                          const Spacer(),
                                          Column(
                                            children: [
                                              Image.asset(
                                                  'assets/images/hourglass.png'),
                                              const Text(
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14),
                                                  '10 Menit'),
                                              const Text(
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 12),
                                                  'Waktu Pengerjaan')
                                            ],
                                          ),
                                          const Spacer(),
                                          Column(
                                            children: [
                                              Image.asset(
                                                  'assets/images/clock.png'),
                                              const Text(
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14),
                                                  '07.00 - 15.00'),
                                              const Text(
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 12),
                                                  'Jam Pengerjaan')
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      );
                    } else {
                      return Text('Error: ${snapshot.error}');
                    }
                  }),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 5.0,
                  runSpacing: 10.0,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/jadwal_page');
                      },
                      child: Container(
                        width: 114,
                        height: 114,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 5,
                                offset: const Offset(0, 5),
                              )
                            ],
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/bookstack.png'),
                            const Text(
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.black),
                                'Materi'),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/quiz_list');
                      },
                      child: Container(
                        width: 114,
                        height: 114,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 5,
                                offset: const Offset(0, 5),
                              )
                            ],
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/ideas.png'),
                            const Text(
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.black),
                                'Daftar Quiz'),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/quiz_ranking');
                      },
                      child: Container(
                        width: 259,
                        height: 114,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 5,
                                offset: const Offset(0, 5),
                              )
                            ],
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/trophy.png'),
                            const Text(
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.black),
                                'Quiz Ranking'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
