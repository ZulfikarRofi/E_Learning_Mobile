import 'package:flutter/material.dart';

class JadwalPage extends StatefulWidget {
  const JadwalPage({Key? key}) : super(key: key);

  @override
  _JadwalPageState createState() => _JadwalPageState();
}

class _JadwalPageState extends State<JadwalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyJadwalWidget(),
    );
  }
}

class MyJadwalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                    'Mata Pelajaran'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: MyDateWidget(),
            ),
            MyTaskWidget(),
          ],
        ),
      ),
    );
  }
}

class MyDateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14),
              width: 120,
              height: 150,
              padding: const EdgeInsets.only(
                  top: 30, bottom: 30, left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(children: [
                Text(
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    'SEN'),
                Text(
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                    '16')
              ]),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14),
              width: 120,
              height: 150,
              padding: const EdgeInsets.only(
                  top: 30, bottom: 30, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(50, 50, 50, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: const Column(children: [
                Text(
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    'SEL'),
                Text(
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                    '16')
              ]),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14),
              width: 120,
              height: 150,
              padding: const EdgeInsets.only(
                  top: 30, bottom: 30, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10)),
              child: const Column(children: [
                Text(
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    'RAB'),
                Text(
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                    '17')
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14),
              width: 120,
              height: 150,
              padding: const EdgeInsets.only(
                  top: 30, bottom: 30, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10)),
              child: const Column(children: [
                Text(
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    'KAM'),
                Text(
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                    '18')
              ]),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14),
              width: 120,
              height: 150,
              padding: const EdgeInsets.only(
                  top: 30, bottom: 30, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10)),
              child: const Column(children: [
                Text(
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    'JUM'),
                Text(
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                    '19')
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14),
              width: 120,
              height: 150,
              padding: const EdgeInsets.only(
                  top: 30, bottom: 30, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10)),
              child: const Column(children: [
                Text(
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    'SAB'),
                Text(
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                    '20')
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14),
              width: 120,
              height: 150,
              padding: const EdgeInsets.only(
                  top: 30, bottom: 30, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10)),
              child: const Column(children: [
                Text(
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    'MIN'),
                Text(
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                    '21')
              ]),
            )
          ],
        ));
  }
}

class MyTaskWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.all(0),
      child: Column(children: [
        AllTask(),
        AllTask(),
        AllTask(),
        AllTask(),
        AllTask(),
        AllTask(),
        AllTask(),
        AllTask(),
        AllTask(),
        AllTask(),
      ]),
    ));
  }
}

class AllTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
          overlayColor: MaterialStatePropertyAll(Colors.transparent)),
      onPressed: () {
        Navigator.pushNamed(context, '/detail_task');
      },
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        padding: const EdgeInsets.only(bottom: 10),
        height: 100,
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Column(
                children: [
                  Text(
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black),
                      '07:30'),
                  Spacer(),
                  Text(
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black),
                      '08:30')
                ],
              ),
            ),
            Container(
              width: 297,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 151, 167, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  SizedBox(
                    width: 12,
                    height: 80,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 125, 145, 1),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                    ),
                  ),
                  Container(
                      width: 285,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      child: Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                                'Task 1 : Tugas Matematika Pytagoras'),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                    child: Image.asset(
                                        'assets/images/teacherr.png'),
                                  ),
                                  const Text(
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 10,
                                          color: Colors.black),
                                      'Pak Subroto')
                                ],
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
