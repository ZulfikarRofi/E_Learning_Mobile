// import 'dart:math';
import 'dart:convert';

import 'package:first_app/Mapel/detail_mapel.dart';
import 'package:first_app/api/api.dart';
// import 'package:first_app/model/mata_pelajaran.dart';
import 'package:first_app/model/materi_mapel.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:toggle_switch/toggle_switch.dart';

class DetailKelas extends StatefulWidget {
  final String? idMapel;
  DetailKelas({required this.idMapel, Key? key}) : super(key: key);

  @override
  _DetailKelasPage createState() => _DetailKelasPage(id: idMapel);
}

class _DetailKelasPage extends State<DetailKelas> {
  bool isDataSelected = true; //initial State
  final String? id;
  _DetailKelasPage({required this.id});

  String? namaMapel, deskripsi, namaGuru, namaKelas;
  double? progress;

  @override
  void initState() {
    super.initState();
  }

  // ValueNotifier<double> valueNotifier = ValueNotifier(progress);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                      border: Border.all(
                          color: Color.fromARGB(255, 214, 214, 214),
                          width: 1.0)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/beranda');
                    },
                    child: const Icon(color: Colors.black, Icons.arrow_back),
                  )),
              const Spacer(),
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
                    child: const Icon(color: Colors.black, Icons.more_vert),
                  )),
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: ApiService().getWhereData('/getDetailMapel', id!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> dataMapel = json.decode(snapshot.data!);
                  namaMapel = dataMapel['data']['nama_mapel'];
                  deskripsi = dataMapel['data']['deskripsi'];
                  namaGuru = dataMapel['data']['nama_guru'];
                  namaKelas = dataMapel['data']['nama_kelas'];
                  progress = dataMapel['data']['progress'];
                  // print(progress);

                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(20.0),
                            padding: const EdgeInsets.all(20),
                            width: 80,
                            height: 80,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(252, 218, 149, 1)),
                            child: Image.asset('assets/images/pen.png'),
                          ),
                          Container(
                            width: 240,
                            // padding: const EdgeInsets.all(2),
                            decoration:
                                const BoxDecoration(color: Colors.transparent),
                            child: Flexible(
                              child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                  // 'MATEMATIKA'
                                  namaMapel!),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontSize: 14),
                              'Tentang Pelajaran'),
                          Container(
                            padding: const EdgeInsets.all(2),
                            width: 344,
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: Flexible(
                              child: Text(
                                  style: const TextStyle(fontSize: 12),
                                  // 'Mata pelajaran matematika kelas 3 tingkat SMP'
                                  deskripsi!),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // padding: const EdgeInsets.only(top: 20),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: const Text(
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey),
                                      'Pengajar'),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: Colors.red),
                                      child: Image.asset(
                                          'assets/images/woman.png'),
                                    ),
                                    Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        width: 200,
                                        // height: 50,
                                        child: Flexible(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.grey),
                                                  namaGuru!),
                                              Text(
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Colors.grey),
                                                  'Guru ' +
                                                      namaMapel! +
                                                      " " +
                                                      namaKelas!),
                                            ],
                                          ),
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                const Text(
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                    'Progress'),
                                Container(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: SimpleCircularProgressBar(
                                    animationDuration: 2,
                                    size: 50,
                                    progressStrokeWidth: 5.0,
                                    backStrokeWidth: 5.0,
                                    progressColors: const [
                                      Color.fromARGB(255, 255, 162, 1),
                                      Colors.lightGreen,
                                      Colors.lightBlue
                                    ],
                                    valueNotifier: ValueNotifier(progress!),
                                    mergeMode: true,
                                    onGetText: (double value) {
                                      return Text(
                                        '${value.toInt()}%',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.green),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return Text('Error: ${snapshot.error}');
                }
              },
            ),

            //Batas Data Mata Pelajaran
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    width: 340,
                    height: 70,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 234, 234, 234),
                    ),
                    child: Center(
                      child: ToggleSwitch(
                        minWidth: 150.0,
                        minHeight: 180.0,
                        fontSize: 18,
                        activeBgColor: [Colors.white],
                        activeFgColor: Colors.black,
                        inactiveBgColor: Color.fromARGB(255, 234, 234, 234),
                        inactiveFgColor: Colors.grey,
                        initialLabelIndex: 0,
                        totalSwitches: 2,
                        labels: ['Materi', 'Tugas'],
                        onToggle: (index) {
                          // print('switched to: $index');
                          setState(() {
                            if (index == 0) {
                              Text('tes 1');
                            } else if (index == 1) {
                              Text('tes 2');
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.assignment_outlined,
                            color: Colors.grey,
                          ),
                          Text(
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                              '2 Materi')
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8.0),
              child: Column(children: [
                FutureBuilder<List<materiMapel>>(
                  future: ApiService().getMateriMapel(id),
                  builder:
                      (context, AsyncSnapshot<List<materiMapel>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // While the future is still running
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      // If an error occurred while fetching the data
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      // If no data is available or the data list is empty
                      return const Text(
                          style: TextStyle(fontSize: 18.0, color: Colors.grey),
                          'Belum ada modul');
                    } else {
                      // If data is available, you can build your UI using the data from the snapshot
                      List<materiMapel> modul = snapshot.data!;
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          materiMapel data = modul[index];
                          print(data.id);
                          return MyMateri(
                            idModul: data.id.toString(),
                            namaModul: data.nama_modul,
                            tanggalRegis: data.tanggal_regis,
                            jamRegis: data.jam_regis,
                          );
                        },
                        itemCount: modul.length,
                      );
                    }
                  },
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

// class FutureLoader extends StatelessWidget {
//   final String? id;
//   const FutureLoader({Key, key, this.id}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(left: 8.0),
//       child: Column(children: [
//         FutureBuilder<List<materiMapel>>(
//           future: ApiService().getMateriMapel(id),
//           builder: (context, AsyncSnapshot<List<materiMapel>> snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               // While the future is still running
//               return const CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               // If an error occurred while fetching the data
//               return Text('Error: ${snapshot.error}');
//             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//               // If no data is available or the data list is empty
//               return const Text(
//                   style: TextStyle(fontSize: 18.0, color: Colors.grey),
//                   'Belum ada modul');
//             } else {
//               // If data is available, you can build your UI using the data from the snapshot
//               List<materiMapel> modul = snapshot.data!;
//               return ListView.builder(
//                 shrinkWrap: true,
//                 scrollDirection: Axis.vertical,
//                 itemBuilder: (context, index) {
//                   materiMapel data = modul[index];
//                   print(data.id);
//                   return MyMateri(
//                       idModul: data.id.toString(),
//                       namaModul: data.nama_modul,
//                       tanggalRegis: data.tanggal_regis);
//                 },
//                 itemCount: modul.length,
//               );
//             }
//           },
//         ),
//       ]),
//     );
//   }
// }

class MyMateri extends StatelessWidget {
  final String? idModul, namaModul, tanggalRegis, jamRegis;
  const MyMateri(
      {Key,
      key,
      this.idModul,
      this.namaModul,
      this.tanggalRegis,
      this.jamRegis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailMapel(id: idModul!),
              ),
            );
          },
          style: const ButtonStyle(
              overlayColor: MaterialStatePropertyAll(Colors.transparent)),
          child: Container(
            width: 344,
            height: 70,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
                offset: const Offset(0, 5),
              )
            ]),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      Container(
                        width: 60,
                        height: 60,
                        color: const Color.fromRGBO(248, 215, 148, 1),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        color: const Color.fromRGBO(255, 206, 107, 1),
                        child: const Icon(
                          Icons.menu_book,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 277,
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.black),
                            // '1. Persamaan Kuadrat'
                            namaModul!),
                      ),
                      Text(
                          style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: Colors.grey),
                          // '14 Mei 2023'
                          tanggalRegis! + ' pukul ' + jamRegis!)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
