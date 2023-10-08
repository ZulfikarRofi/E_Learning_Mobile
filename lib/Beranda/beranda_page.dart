import 'dart:convert';
import 'package:first_app/Beranda/components/list_mapel.dart';
import 'package:first_app/api/api.dart';
import 'package:first_app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({Key? key}) : super(key: key);

  @override
  _BerandaPageState createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  int currentIndex = 0;
  String _selectedItem = 'Item 1';
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
        print('identitas = ' + id);
      });
    }
  }

  // getDataMapel() async {
  //   var dataMapel = await ApiService().getWhereData('/getMapelSiswa', id!)
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Image.asset(
                'assets/images/gamer.png',
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 12),
                      name),
                ),
                const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 12),
                        'Kelas VI')),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: 50,
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey, // Set border color
                          width: 1.0),
                      borderRadius: BorderRadius.circular(25)),
                  child:
                      // Image.asset('assets/images/bell.png'),
                      PopupMenuButton(
                    icon: const Icon(Icons.notifications),
                    onSelected: (value) {
                      setState(() {
                        _selectedItem = value;
                      });
                    },
                    itemBuilder: (BuildContext context) {
                      return <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'Item 1',
                          child: Text('Item 1'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'Item 2',
                          child: Text('Item 2'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'Item 3',
                          child: Text('Item 3'),
                        ),
                      ];
                    },
                  )),
            ),
          ],
        ),
      ),
      body: MyScrollableWidget(id: id),
    );
  }
}

class MyScrollableWidget extends StatelessWidget {
  final String? id;

  const MyScrollableWidget({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Center(
        child: Column(children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
                    'Kelas Ku'),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 10, right: 15),
                child: Text('Lihat semua...'),
              )
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(children: <Widget>[
                FutureBuilder(
                  future: ApiService().getWhereData('/getMapelSiswa', id!),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                            "Something wrong with message: ${snapshot.error.toString()}"),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      Map<String, dynamic> dat = jsonDecode(snapshot.data!);
                      print(dat);
                      if (dat['id'] == null) {
                        return Container(
                          padding: const EdgeInsets.all(20),
                          child: const Text(
                              style: TextStyle(fontWeight: FontWeight.w600),
                              'Tidak ada Mata Pelajaran yang diikuti'),
                        );
                      } else {
                        return ListMapel(
                          namaMapel: dat['nama_mapel'],
                          // progress: dat['progress'],
                          // daftarMurid: dat['daftar_murid'],
                          namaGuru: dat['nama_guru'],
                          totalMateri: dat['total_materi'],
                        );
                      }
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
                // Add more horizontal items as needed
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
                width: 500,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 10, left: 10),
                        child: Column(
                          children: [
                            const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 150,
                                      child: Text(
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                          'Tugas Yang Belum Diselesaikan')),
                                  Spacer(),
                                  Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text(
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12),
                                          'Lihat Semua..'))
                                ]),
                            FutureBuilder(
                              future:
                                  ApiService().getWhereData('/getTugasKu', id!),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return Center(
                                    child: Text(
                                        "Something wrong with message: ${snapshot.error.toString()}"),
                                  );
                                } else if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  Map<String, dynamic> dat =
                                      jsonDecode(snapshot.data!);
                                  print(dat);
                                  if (dat['id'] == null) {
                                    return Container(
                                      padding: const EdgeInsets.all(20),
                                      child: const Text(
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                          'Tidak ada tugas yang belum dikerjakan'),
                                    );
                                  } else {
                                    return listTugas(
                                      namaTugas: dat['nama_tugas'],
                                      namaKelas: dat['nama_kelas'],
                                      namaMapel: dat['nama_mapel'],
                                      tanggalAkhir: dat['due_date'],
                                    );
                                  }
                                } else if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else {
                                  return const CircularProgressIndicator();
                                }
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ]),
      ),
    ));
  }
}

class listTugas extends StatelessWidget {
  final String? namaTugas, namaKelas, namaMapel, tanggalAkhir;
  const listTugas({
    Key,
    key,
    this.namaKelas,
    this.namaMapel,
    this.namaTugas,
    this.tanggalAkhir,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/detail_task');
            },
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            child: Row(
              children: [
                SizedBox(
                    width: 60,
                    height: 60,
                    child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(214, 228, 218, 1),
                            borderRadius: BorderRadius.circular(50)),
                        child: Image.asset('assets/images/pen.png'))),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          style: TextStyle(
                              fontWeight: FontWeight.w900, color: Colors.black),
                          'Menggambar Denah Rumah'),
                      Text(
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.black),
                          'Kelas Seni Rupa')
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                      'Kam, 20 Sep 23'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
