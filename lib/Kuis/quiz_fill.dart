import 'package:first_app/Kuis/quiz_result.dart';
import 'package:first_app/data/question_example.dart';
import 'package:flutter/material.dart';

class QuizFill extends StatefulWidget {
  const QuizFill({Key? key}) : super(key: key);

  @override
  _QuizFillState createState() => _QuizFillState();
}

class _QuizFillState extends State<QuizFill> {
  //Answer Button Color
  final abjad = ['A', 'B', 'C', 'D', 'E'];
  Color btnFirst = Colors.white;
  Color btnSecond = Colors.white;
  List<List<Color>> gradientColors = [
    [Colors.blue, Colors.green],
    [Colors.purple, Colors.pink],
    [
      const Color.fromARGB(255, 255, 251, 21),
      const Color.fromARGB(255, 255, 162, 49)
    ],
    [const Color.fromARGB(255, 235, 172, 193), Colors.lightBlue],
    [Colors.teal, Colors.cyan],
    [Colors.indigo, Colors.blue],
    [Colors.pink, Colors.purple],
    [Colors.amber, Colors.orange],
    [Colors.green, Colors.lightGreen],
    [Colors.deepPurple, Colors.indigo],
  ];

  //Controllers
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  PageController? _controller;
  bool isPressed = false;
  Color isTrue = const Color.fromARGB(255, 1, 145, 5);
  Color isFalse = const Color.fromARGB(255, 206, 14, 0);
  int score = 0;
  int trueAnswers = 0;
  int falseAnswers = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 31, 53),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller!,
        onPageChanged: (page) {
          setState(() {
            isPressed = false;
          });
        },
        itemCount: question.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: const Text(
                      '10:00:00',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                        )),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                        'Soal ${index + 1}/${question.length}'),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width) - 50,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Text(
                      question[index].question!,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              for (int i = 0; i < question[index].answer!.length; i++)
                MaterialButton(
                  onPressed: isPressed
                      ? () {}
                      : () {
                          setState(() {
                            isPressed = true;
                          });
                          if (question[index]
                              .answer!
                              .entries
                              .toList()[i]
                              .value) {
                            score += 10;
                            trueAnswers += 1;
                          } else {
                            falseAnswers += 1;
                          }
                        },
                  splashColor: Colors.transparent,
                  child: Container(
                      width: 330,
                      padding: const EdgeInsets.all(16.0),
                      margin: const EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                          color: isPressed
                              ? question[index]
                                      .answer!
                                      .entries
                                      .toList()[i]
                                      .value
                                  ? isTrue
                                  : isFalse
                              : btnSecond,
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        children: [
                          Container(
                            width: 36.0,
                            height: 36.0,
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            margin: const EdgeInsets.only(right: 4.0),
                            decoration: BoxDecoration(
                                gradient:
                                    LinearGradient(colors: gradientColors[i]),
                                borderRadius: BorderRadius.circular(18)),
                            child: Text(
                              abjad[i],
                              style: const TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(
                            question[index].answer!.keys.toList()[i],
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      )),
                ),
              const SizedBox(
                height: 50,
              ),
              OutlinedButton(
                onPressed: isPressed
                    ? index + 1 == question.length
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuizResult(
                                    score, trueAnswers, falseAnswers),
                              ),
                            );
                          }
                        : () {
                            _controller!.nextPage(
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.linear);
                          }
                    : null,
                style: const ButtonStyle(
                    overlayColor: MaterialStatePropertyAll(Colors.transparent)),
                child: Text(
                  index + 1 == question.length
                      ? 'Lihat Hasil'
                      : 'Soal Selanjutnya',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
