import 'package:flutter/material.dart';

class QuizResult extends StatefulWidget {
  final int score;
  final int trueAnswers;
  final int falseAnswers;
  QuizResult(this.score, this.trueAnswers, this.falseAnswers, {Key? key})
      : super(key: key);

  @override
  _QuizResultPage createState() => _QuizResultPage();
}

class _QuizResultPage extends State<QuizResult> {
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/quiz_page');
                    },
                    child: const Icon(color: Colors.black, Icons.arrow_back),
                  )),
            ],
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: (MediaQuery.of(context).size.height),
            width: (MediaQuery.of(context).size.width),
            color: const Color.fromRGBO(38, 37, 37, 1),
            child: Container(
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
                      bottom: 40,
                      right: 20,
                      child: Container(
                        width: 124,
                        height: 119,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(50, 50, 50, 1),
                            borderRadius: BorderRadius.circular(60)),
                      )),
                  Positioned(
                      bottom: 160,
                      left: 120,
                      child: Container(
                        width: 61,
                        height: 64,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(50, 50, 50, 1),
                            borderRadius: BorderRadius.circular(60)),
                      )),
                  Positioned(
                      bottom: 200,
                      left: 10,
                      child: Container(
                        width: 54,
                        height: 51,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(50, 50, 50, 1),
                            borderRadius: BorderRadius.circular(60)),
                      )),
                  Positioned(
                      bottom: 250,
                      right: -60,
                      child: Container(
                        width: 190,
                        height: 190,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(50, 50, 50, 1),
                            borderRadius: BorderRadius.circular(95)),
                      )),
                  Positioned(
                      bottom: -90,
                      left: 120,
                      child: Container(
                        width: 148,
                        height: 148,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(50, 50, 50, 1),
                            borderRadius: BorderRadius.circular(75)),
                      )),
                  Positioned(
                      top: 200,
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
                          ),
                          Column(
                            children: [
                              const Text(
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                  'Skor Kamu'),
                              Text(
                                  style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w600),
                                  '${widget.score}'),
                            ],
                          )
                        ],
                      )),
                  Positioned(
                      bottom: 200,
                      right: 95,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        width: 192,
                        height: 155,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(50, 50, 50, 1),
                            border: Border.all(color: Colors.white, width: 1.5),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/clock.png',
                                  scale: 0.7,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                          '5.30'),
                                      Text(
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.white),
                                          'Waktu Pengerjaan')
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/correct.png',
                                  scale: 1.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.green),
                                          '${widget.trueAnswers}'),
                                      const Text(
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.white),
                                          'Jawaban Benar')
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/cancel.png',
                                  scale: 0.9,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.red),
                                          '${widget.falseAnswers}'),
                                      const Text(
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.white),
                                          'Jawaban Salah')
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
