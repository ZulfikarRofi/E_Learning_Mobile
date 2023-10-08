import 'package:flutter/material.dart';

class DetailTask extends StatefulWidget {
  const DetailTask({Key? key}) : super(key: key);

  @override
  _DetailTaskPage createState() => _DetailTaskPage();
}

class _DetailTaskPage extends State<DetailTask> {
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
                onPressed: () {},
                child: const Icon(color: Colors.black, Icons.arrow_back),
              )),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                              height: 80, width: 80, 'assets/images/pen.png')),
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 14),
                          child: Text(
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 24),
                              'Peta Dunia'),
                        ),
                        Text(
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 16),
                            'Geografi VII-C')
                      ],
                    )
                  ],
                ),
                const Row(children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.grey),
                            'Tentang Tugas :'),
                      ),
                      Text('Isi Soal')
                    ],
                  )
                ]),
                const SizedBox(
                  height: 210,
                ),
                Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 30),
                        width: 344,
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: Colors.grey, width: 1.0))),
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
                        padding: EdgeInsets.all(10),
                        child: Image.asset('assets/images/murid.png'),
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                              'Pak Marsono'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12),
                              'Guru Pendidikan Kewarganegaraan'),
                        ),
                      ],
                    )
                  ],
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 10),
                      child: Text(
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.grey),
                          'Batas Pengerjaan'),
                    )
                  ],
                ),
                const Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                                color: Colors.black),
                            'Selasa, 17 Maret 2023')),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: 340,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.white),
                        'Tugas Selesai'),
                  ),
                )
              ])),
        ));
  }
}
