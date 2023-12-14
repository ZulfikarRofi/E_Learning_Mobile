import 'dart:convert';

import 'package:first_app/Beranda/components/list_mapel.dart';
import 'package:first_app/Mapel/detail_task.dart';
import 'package:first_app/api/api.dart';
import 'package:first_app/model/mata_pelajaran.dart';
import 'package:first_app/model/tugas_model.dart';
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
  String idSiswa = '';

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
        idSiswa = user.siswa_id.toString();
        // print('idSiswa :' + idSiswa);
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
      body: MyScrollableWidget(id: id, idSiswa: idSiswa),
    );
  }
}

class MyScrollableWidget extends StatelessWidget {
  final String? id, idSiswa;

  const MyScrollableWidget({
    Key? key,
    this.id,
    this.idSiswa,
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
          Container(
            height: 300,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FutureBuilder<List<MataPelajaran>>(
              future: ApiService().getMataPelajaran(idSiswa!),
              builder: (context, AsyncSnapshot<List<MataPelajaran>> snapshot) {
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
                  // If data is available, you can build your UI using the data from the snapshot
                  List<MataPelajaran> mapel = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      MataPelajaran data = mapel[index];
                      // ignore: avoid_print
                      print(data.progress);
                      return ListMapel(
                        idMapel: data.id.toString(),
                        namaMapel: data.nama_mapel,
                        progress: double.parse(data.progress),
                        namaGuru: data.nama_guru,
                        totalMateri: data.mapel_id.toString(),
                      );
                    },
                    itemCount: mapel.length,
                  );
                }
              },
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
                                      'Lihat Semua..'),
                                ),
                              ],
                            ),
                            FutureBuilder<List<Task>>(
                                future: ApiService().getTaskSiswa(idSiswa),
                                builder: ((context,
                                    AsyncSnapshot<List<Task>> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    // While the future is still running
                                    return const CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    // If an error occurred while fetching the data
                                    return Text('Error: ${snapshot.error}');
                                  } else if (!snapshot.hasData ||
                                      snapshot.data!.isEmpty) {
                                    // If no data is available or the data list is empty
                                    return const Text('No data available');
                                  } else {
                                    // If data is available, you can build your UI using the data from the snapshot
                                    List<Task> task = snapshot.data!;
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        Task data = task[index];
                                        // ignore: avoid_print
                                        print(data);
                                        return listTugas(
                                          idTugas: data.id.toString(),
                                          namaMapel: data.nama_mapel,
                                          namaKelas: data.nama_kelas,
                                          namaTugas: data.nama_tugas,
                                          tanggalAkhir: data.due_date,
                                        );
                                      },
                                      itemCount: task.length,
                                    );
                                  }
                                }))
                            //Listing Tugas Here
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
  final String? idTugas, namaTugas, namaKelas, namaMapel, tanggalAkhir;
  const listTugas({
    Key,
    key,
    this.idTugas,
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailTask(idTugas: idTugas),
                ),
              );
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
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  width: 136,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          style: const TextStyle(
                              fontWeight: FontWeight.w900, color: Colors.black),
                          namaTugas!),
                      Text(
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.black),
                        namaMapel! + " " + "Kelas " + namaKelas!,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 52.0,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                      tanggalAkhir!),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
