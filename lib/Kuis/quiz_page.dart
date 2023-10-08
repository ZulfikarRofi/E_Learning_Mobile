import 'dart:async';

import 'package:first_app/Kuis/quiz_fill.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizPage createState() => _QuizPage();
}

class _QuizPage extends State<Quiz> {
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
              Container(
                width: 400,
                height: 400,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(38, 37, 37, 1),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40))),
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        left: 148,
                        child: Container(
                          width: 81,
                          height: 81,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(50, 50, 50, 1),
                              borderRadius: BorderRadius.circular(40.5)),
                        )),
                    Positioned(
                        top: 80,
                        left: -60,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(50, 50, 50, 1),
                              borderRadius: BorderRadius.circular(60)),
                        )),
                    Positioned(
                        bottom: 70,
                        left: 20,
                        child: Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(50, 50, 50, 1),
                              borderRadius: BorderRadius.circular(23)),
                        )),
                    Positioned(
                        top: 80,
                        right: 60,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(50, 50, 50, 1),
                              borderRadius: BorderRadius.circular(20)),
                        )),
                    Positioned(
                        bottom: 80,
                        right: -60,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(50, 50, 50, 1),
                              borderRadius: BorderRadius.circular(60)),
                        )),
                    Positioned(
                        top: 100,
                        left: 75,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 226,
                              height: 226,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(96, 92, 92, 1),
                                  borderRadius: BorderRadius.circular(113)),
                            ),
                            Container(
                              width: 175,
                              height: 175,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(143, 137, 137, 1),
                                  borderRadius: BorderRadius.circular(88)),
                            ),
                            Container(
                              width: 145,
                              height: 145,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  borderRadius: BorderRadius.circular(75)),
                              child: TextButton(
                                style: const ButtonStyle(
                                    overlayColor: MaterialStatePropertyAll(
                                        Colors.transparent)),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/quiz_fill');
                                },
                                child: const Text(
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 24,
                                        color: Colors.black),
                                    'MULAI'),
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ),
              Row(
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
                            const Text(
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                                'Quiz 4 - Ilmu Pengetahuan Alam'),
                            const Text(
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300),
                                'Topik : Zat dan  Perubahannya'),
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
                                      const Text(
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                          '20 Soal'),
                                      const Text(
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
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
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                          '30 Menit'),
                                      const Text(
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12),
                                          'Waktu Pengerjaan')
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      Image.asset('assets/images/clock.png'),
                                      const Text(
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                          '07.00 - 12.00'),
                                      const Text(
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
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
              ),
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
