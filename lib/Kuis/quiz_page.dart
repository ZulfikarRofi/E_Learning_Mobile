// import 'dart:convert';

// import 'package:first_app/Kuis/components/quizpage_background.dart';
// import 'package:first_app/Kuis/quiz_ranking.dart';
// import 'package:first_app/api/api.dart';
// import 'package:flutter/material.dart';

// class Quiz extends StatefulWidget {
//   final String idKuis;
//   const Quiz({
//     Key? key,
//     required this.idKuis,
//   }) : super(key: key);

//   @override
//   _QuizPage createState() => _QuizPage(
//         idKuis: idKuis,
//       );
// }

// class _QuizPage extends State<Quiz> {
//   late String idKuis,
//       namaMapel,
//       namaKuis,
//       namaKelas,
//       totalSoal,
//       kuisId,
//       totalWaktu;
//   _QuizPage({
//     required this.idKuis,
//   });

//   @override
//   void initState() {
//     super.initState();
//     // getDataKuis();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         elevation: 0,
//         title: Row(
//           children: [
//             Container(
//                 width: 50,
//                 height: 50,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(25),
//                     color: Colors.white,
//                     border: Border.all(
//                         color: const Color.fromARGB(255, 214, 214, 214),
//                         width: 1.0)),
//                 child: TextButton(
//                   onPressed: () {},
//                   child: const Icon(color: Colors.black, Icons.arrow_back),
//                 )),
//           ],
//         ),
//         backgroundColor: Colors.transparent,
//       ),
//       body: FutureBuilder(
//           future: ApiService().getWhereData('/getDetailKuis', idKuis),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const CircularProgressIndicator();
//             } else if (snapshot.connectionState == ConnectionState.done) {
//               print(snapshot.data);
//               Map<String, dynamic> dataKuis = json.decode(snapshot.data!);
//               kuisId = dataKuis['data'][0]['id_kuis'].toString();
//               namaKuis = dataKuis['data'][0]['nama_kuis'];
//               namaMapel = dataKuis['data'][0]['nama_mapel'];
//               namaKelas = dataKuis['data'][0]['nama_kelas'];
//               totalSoal = dataKuis['data'][0]['total_soal'].toString();
//               totalWaktu = (dataKuis['data'][0]['total_soal'] * 0.5).toString();
//               return SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     QuizpageBackground(idKuis: kuisId),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(10),
//                           width: 350,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(20),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.withOpacity(0.5),
//                                   blurRadius: 5,
//                                   offset: const Offset(0, 5),
//                                 )
//                               ]),
//                           child: Flexible(
//                             child: Column(
//                               children: [
//                                 Text(
//                                     style: const TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.w600),
//                                     // 'Quiz 1 - Matematika'
//                                     "Kuis - $namaMapel"),
//                                 Text(
//                                     style: const TextStyle(
//                                         fontSize: 12,
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.w300),
//                                     // 'Topik : Aljabar',
//                                     namaKuis),
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       top: 30, right: 30, left: 30),
//                                   child: Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Column(
//                                         children: [
//                                           Image.asset(
//                                               'assets/images/question.png'),
//                                           Text(
//                                               style: const TextStyle(
//                                                   fontWeight: FontWeight.w500,
//                                                   fontSize: 14),
//                                               '$totalSoal Soal'),
//                                           const Text(
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.w300,
//                                                   fontSize: 12),
//                                               'Total Soal')
//                                         ],
//                                       ),
//                                       const Spacer(),
//                                       Column(
//                                         children: [
//                                           Image.asset(
//                                               'assets/images/hourglass.png'),
//                                           Text(
//                                               style: const TextStyle(
//                                                   fontWeight: FontWeight.w500,
//                                                   fontSize: 14),
//                                               "${totalWaktu} Menit"),
//                                           const Text(
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.w300,
//                                                   fontSize: 12),
//                                               'Waktu Pengerjaan')
//                                         ],
//                                       ),
//                                       const Spacer(),
//                                       Column(
//                                         children: [
//                                           Image.asset(
//                                               'assets/images/clock.png'),
//                                           const Text(
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.w500,
//                                                   fontSize: 14),
//                                               '07.00 - 15.00'),
//                                           const Text(
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.w300,
//                                                   fontSize: 12),
//                                               'Jam Pengerjaan')
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 20, horizontal: 50),
//                       child: Wrap(
//                         direction: Axis.horizontal,
//                         spacing: 5.0,
//                         runSpacing: 10.0,
//                         children: [
//                           TextButton(
//                             style: ButtonStyle(
//                               overlayColor:
//                                   MaterialStateProperty.all(Colors.transparent),
//                             ),
//                             onPressed: () {
//                               Navigator.pushNamed(context, '/jadwal_page');
//                             },
//                             child: Container(
//                               width: 114,
//                               height: 114,
//                               padding: const EdgeInsets.all(3),
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5),
//                                       blurRadius: 5,
//                                       offset: const Offset(0, 5),
//                                     )
//                                   ],
//                                   borderRadius: BorderRadius.circular(15)),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Image.asset('assets/images/bookstack.png'),
//                                   const Text(
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 16,
//                                           color: Colors.black),
//                                       'Materi'),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           TextButton(
//                             style: ButtonStyle(
//                               overlayColor:
//                                   MaterialStateProperty.all(Colors.transparent),
//                             ),
//                             onPressed: () {
//                               Navigator.pushNamed(context, '/quiz_list');
//                             },
//                             child: Container(
//                               width: 114,
//                               height: 114,
//                               padding: const EdgeInsets.all(3),
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5),
//                                       blurRadius: 5,
//                                       offset: const Offset(0, 5),
//                                     )
//                                   ],
//                                   borderRadius: BorderRadius.circular(15)),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Image.asset('assets/images/ideas.png'),
//                                   const Text(
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 16,
//                                           color: Colors.black),
//                                       'Daftar Quiz'),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           TextButton(
//                             style: ButtonStyle(
//                               overlayColor:
//                                   MaterialStateProperty.all(Colors.transparent),
//                             ),
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => QuizRanking(
//                                     kuisId: idKuis,
//                                   ),
//                                 ),
//                               );
//                             },
//                             child: Container(
//                               width: 259,
//                               height: 114,
//                               padding: const EdgeInsets.all(3),
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5),
//                                       blurRadius: 5,
//                                       offset: const Offset(0, 5),
//                                     )
//                                   ],
//                                   borderRadius: BorderRadius.circular(15)),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Image.asset('assets/images/trophy.png'),
//                                   const Text(
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 16,
//                                           color: Colors.black),
//                                       'Quiz Ranking'),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               );
//             } else {
//               return Text('Error: ${snapshot.error}');
//             }
//           }),
//     );
//   }
// }

import 'dart:convert';

import 'package:first_app/Kuis/components/quizpage_background.dart';
import 'package:first_app/Kuis/quiz_ranking.dart';
import 'package:first_app/api/api.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  final String idKuis;
  const Quiz({
    Key? key,
    required this.idKuis,
  }) : super(key: key);

  @override
  _QuizPage createState() => _QuizPage(
        idKuis: idKuis,
      );
}

class _QuizPage extends State<Quiz> {
  late String idKuis,
      namaMapel,
      namaKuis,
      namaKelas,
      totalSoal,
      kuisId,
      totalWaktu;
  _QuizPage({
    required this.idKuis,
  });

  @override
  void initState() {
    super.initState();
    getDataKuis();
  }

  Future<void> getDataKuis() async {
    try {
      final response =
          await ApiService().getWhereData('/getDetailKuis', idKuis);
      final Map<String, dynamic> dataKuis = json.decode(response);
      kuisId = dataKuis['data'][0]['id_kuis'].toString();
      namaKuis = dataKuis['data'][0]['nama_kuis'];
      namaMapel = dataKuis['data'][0]['nama_mapel'];
      namaKelas = dataKuis['data'][0]['nama_kelas'];
      totalSoal = dataKuis['data'][0]['total_soal'].toString();
      totalWaktu = (int.parse(totalSoal) * 0.5).toString();
    } catch (e) {
      print('Error: $e');
    }
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
                  width: 1.0,
                ),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder(
        future: ApiService().getWhereData('/getDetailKuis', idKuis),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data available'));
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  QuizpageBackground(idKuis: kuisId),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Kuis - $namaMapel",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              namaKuis,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30, right: 30, left: 30),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Image.asset('assets/images/question.png'),
                                      Text(
                                        '$totalSoal Soal',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const Text(
                                        'Total Soal',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      Image.asset(
                                          'assets/images/hourglass.png'),
                                      Text(
                                        "$totalWaktu Menit",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const Text(
                                        'Waktu Pengerjaan',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      Image.asset('assets/images/clock.png'),
                                      const Text(
                                        '07.00 - 15.00',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const Text(
                                        'Jam Pengerjaan',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 50),
                    child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 5.0,
                      runSpacing: 10.0,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/jadwal_page');
                          },
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          child: Container(
                            width: 114,
                            height: 114,
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                  offset: Offset(0, 5),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/bookstack.png'),
                                const Text(
                                  'Materi',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/quiz_list');
                          },
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          child: Container(
                            width: 114,
                            height: 114,
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                  offset: Offset(0, 5),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/ideas.png'),
                                const Text(
                                  'Daftar Quiz',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    QuizRanking(kuisId: idKuis),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          child: Container(
                            width: 259,
                            height: 114,
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                  offset: Offset(0, 5),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/trophy.png'),
                                const Text(
                                  'Quiz Ranking',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
