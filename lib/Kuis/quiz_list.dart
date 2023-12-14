import 'dart:convert';

import 'package:first_app/Kuis/quiz_page.dart';
import 'package:first_app/api/api.dart';
import 'package:first_app/model/quiz_model.dart';
import 'package:first_app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizList extends StatefulWidget {
  const QuizList({Key? key}) : super(key: key);

  @override
  _QuizListState createState() => _QuizListState();
}

class _QuizListState extends State<QuizList> {
  String id = '';
  String? statusKuis = 'Belum Dikerjakan';

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
        id = user.siswa_id.toString();
        // name = user.name.toString();
        print(user);
      });
    }
  }

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
            child: AllQuiz(id: id, statusKuis: statusKuis),
          )
        ]),
      )),
    );
  }
}

class AllQuiz extends StatelessWidget {
  String? statusKuis;
  final String? id;

  AllQuiz({
    Key? key,
    this.id,
    this.statusKuis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FutureBuilder<List<QuizModel>>(
        future: ApiService().getKuisSiswa(id!),
        builder: (context, AsyncSnapshot<List<QuizModel>> snapshot) {
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
            List<QuizModel> kuis = snapshot.data!;
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                QuizModel data = kuis[index];

                print(data);

                return MyQuiz(
                  idKuis: data.id_kuis.toString(),
                  namaMapel: data.nama_mapel,
                  namaKuis: data.nama_kuis,
                  namaKelas: data.nama_kelas,
                  tanggalAkhir: data.duedate,
                  statusKuis: statusKuis,
                );
              },
              itemCount: kuis.length,
            );
          }
        },
      ),
      //Looping
    ]);
  }
}

class MyQuiz extends StatelessWidget {
  final String? idKuis,
      namaKuis,
      namaKelas,
      namaMapel,
      tanggalAkhir,
      statusKuis;

  const MyQuiz({
    Key,
    key,
    this.idKuis,
    this.namaKuis,
    this.namaKelas,
    this.namaMapel,
    this.tanggalAkhir,
    this.statusKuis,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Quiz(idKuis: idKuis!),
            ),
          );
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
                  Container(
                    width: 120.0,
                    padding: EdgeInsets.only(left: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 14),
                            softWrap: false,
                            // 'Kuis 1 : Aljabar'
                            namaKuis!),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                fontSize: 12),
                            // 'Matematika Kelas IX-A'
                            namaMapel! + " " + namaKelas!)
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 35),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 10),
                            textAlign: TextAlign.right,
                            softWrap: false,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            // 'Kam, 18 Nov 2023'
                            tanggalAkhir!),
                        Text(
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 10),
                          textAlign: TextAlign.right,
                          // 'Belum Dikerjakan',
                          statusKuis!,
                        )
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
