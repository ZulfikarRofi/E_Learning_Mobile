import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class DetailKelas extends StatefulWidget {
  const DetailKelas({Key? key}) : super(key: key);

  @override
  _DetailKelasPage createState() => _DetailKelasPage();
}

class _DetailKelasPage extends State<DetailKelas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  border: Border.all(
                      color: Color.fromARGB(255, 214, 214, 214), width: 1.0)),
              child: TextButton(
                onPressed: () {},
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
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(252, 218, 149, 1)),
                    child: Image.asset('assets/images/pen.png'),
                  ),
                ),
                Container(
                  width: 240,
                  padding: EdgeInsets.all(2),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: const Flexible(
                      child: Text(
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                          'Pendidikan Kewarganegaraan')),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Column(
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
                        decoration: const BoxDecoration(color: Colors.white),
                        child: const Flexible(
                            child: Text(
                                style: TextStyle(fontSize: 12),
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla interdum neque enim, lacinia feugiat urna pellentesque et. Curabitur gravida pulvinar nulla. Donec ex elit, ullamcorper condimentum pulvinar at, feugiat sed nunc. ')),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                    'Pengajar'),
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
                                          'assets/images/murid.png'),
                                    ),
                                    Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        width: 200,
                                        // height: 50,
                                        child: const Flexible(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.grey),
                                                  'Pak Marsono'),
                                              Text(
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Colors.grey),
                                                  'Guru Pendidikan Kewarganegaraan'),
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
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Image.asset(
                                    'assets/images/progress.png',
                                    scale: 0.6,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
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
                            print('switched to: $index');
                          },
                        ),
                      )),
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
                              '20 Materi')
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(children: [
                MyMateri(),
                MyMateri(),
                MyMateri(),
                MyMateri(),
                MyMateri(),
                MyMateri(),
                MyMateri(),
                MyMateri(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class MyMateri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Container(
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
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                  '1. Asal Usul Perang Diponegoro'),
                            ),
                            Text(
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13,
                                    color: Colors.grey),
                                '14 Mei 2023')
                          ],
                        ))
                  ],
                ))
          ],
        ));
  }
}
