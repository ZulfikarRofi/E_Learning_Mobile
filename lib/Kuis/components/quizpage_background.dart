import 'package:first_app/Kuis/quiz_fill.dart';
import 'package:flutter/material.dart';

class QuizpageBackground extends StatelessWidget {
  final String? idKuis;

  // ignore: avoid_types_as_parameter_names
  const QuizpageBackground({key, required this.idKuis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    color: const Color.fromRGBO(50, 50, 50, 1),
                    borderRadius: BorderRadius.circular(40.5)),
              )),
          Positioned(
              top: 80,
              left: -60,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(50, 50, 50, 1),
                    borderRadius: BorderRadius.circular(60)),
              )),
          Positioned(
              bottom: 70,
              left: 20,
              child: Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(50, 50, 50, 1),
                    borderRadius: BorderRadius.circular(23)),
              )),
          Positioned(
              top: 80,
              right: 60,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(50, 50, 50, 1),
                    borderRadius: BorderRadius.circular(20)),
              )),
          Positioned(
              bottom: 80,
              right: -60,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(50, 50, 50, 1),
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
                        color: const Color.fromRGBO(96, 92, 92, 1),
                        borderRadius: BorderRadius.circular(113)),
                  ),
                  Container(
                    width: 175,
                    height: 175,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(143, 137, 137, 1),
                        borderRadius: BorderRadius.circular(88)),
                  ),
                  Container(
                    width: 145,
                    height: 145,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(75)),
                    child: TextButton(
                      style: const ButtonStyle(
                          overlayColor:
                              MaterialStatePropertyAll(Colors.transparent)),
                      onPressed: () {
                        // Navigator.pushNamed(context, '/quiz_fill');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizFill(idKuis: idKuis!),
                          ),
                        );
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
    );
  }
}
