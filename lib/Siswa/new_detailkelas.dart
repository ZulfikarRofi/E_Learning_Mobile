import 'dart:convert';
import 'package:first_app/Mapel/detail_mapel.dart';
import 'package:first_app/api/api.dart';
import 'package:first_app/model/materi_mapel.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:toggle_switch/toggle_switch.dart';

class DetailKelas extends StatefulWidget {
  final String? idMapel;

  DetailKelas({required this.idMapel, Key? key}) : super(key: key);

  @override
  _DetailKelasState createState() => _DetailKelasState(id: idMapel);
}

class _DetailKelasState extends State<DetailKelas> {
  final String? id;

  _DetailKelasState({required this.id});

  String? namaMapel, deskripsi, namaGuru, namaKelas;
  double progress = 0.0;

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
                  width: 1.0,
                ),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/beranda');
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
            Spacer(),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                border: Border.all(
                  color: Color.fromARGB(255, 214, 214, 214),
                  width: 1.0,
                ),
              ),
              child: TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: ApiService().getWhereData('/getDetailMapel', id!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              Map<String, dynamic> dataMapel = json.decode(snapshot.data as String);
              progress = double.parse(dataMapel['data']['progress']);
              namaMapel = dataMapel['data']['nama_mapel'];
              deskripsi = dataMapel['data']['deskripsi'];
              namaGuru = dataMapel['data']['nama_guru'];
              namaKelas = dataMapel['data']['nama_kelas'];

              return Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20.0),
                        padding: EdgeInsets.all(20),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(252, 218, 149, 1),
                        ),
                        child: Image.asset('assets/images/pen.png'),
                      ),
                      Container(
                        width: 240,
                        child: Text(
                          namaMapel!,
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tentang Pelajaran',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        width: 344,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Text(
                          deskripsi!,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                'Pengajar',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.red,
                                  ),
                                  child: Image.asset('assets/images/woman.png'),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  width: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        namaGuru!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        'Guru $namaMapel $namaKelas',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Text(
                              'Progress',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 8),
                              child: SimpleCircularProgressBar(
                                animationDuration: 2,
                                size: 50,
                                progressStrokeWidth: 5.0,
                                backStrokeWidth: 5.0,
                                progressColors: [
                                  Color.fromARGB(255, 255, 162, 1),
                                  Colors.lightGreen,
                                  Colors.lightBlue,
                                ],
                                valueNotifier: ValueNotifier(progress),
                                mergeMode: true,
                                onGetText: (double value) {
                                  return Text(
                                    '${value.toInt()}%',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 340,
                          height: 70,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
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
                                // Handle toggle
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
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
                                  '2 Materi',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  FutureBuilder<List<materiMapel>>(
                    future: ApiService().getMateriMapel(id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Text(
                          'Belum ada modul',
                          style: TextStyle(fontSize: 18.0, color: Colors.grey),
                        );
                      } else {
                        List<materiMapel> modul = snapshot.data!;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            materiMapel data = modul[index];
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
                ],
              );
            } else {
              return Text('Error: ${snapshot.error}');
            }
          },
        ),
      ),
    );
  }
}

class MyMateri extends StatelessWidget {
  final String? idModul, namaModul, tanggalRegis, jamRegis;

  const MyMateri({Key? key, this.idModul, this.namaModul, this.tanggalRegis, this.jamRegis})
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
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed))
                  return Colors.transparent;
                return null;
              },
            ),
          ),
          child: Container(
            width: 344,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 5,
                  offset: Offset(0, 5),
                )
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 7),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      Container(
                        width: 60,
                        height: 60,
                        color: Color.fromRGBO(248, 215, 148, 1),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        color: Color.fromRGBO(255, 206, 107, 1),
                        child: Icon(
                          Icons.menu_book,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 277,
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          namaModul!,
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),
                        ),
                      ),
                      Text(
                        '$tanggalRegis pukul $jamRegis',
                        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13, color: Colors.grey),
                      ),
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
