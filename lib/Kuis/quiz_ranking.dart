import 'dart:convert';
import 'package:first_app/api/api.dart';
import 'package:first_app/model/ranking.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

// ignore: must_be_immutable
class QuizRanking extends StatefulWidget {
  String kuisId;
  QuizRanking({
    Key? key,
    required this.kuisId,
  }) : super(key: key);

  @override
  _QuizRankingPage createState() => _QuizRankingPage(kuisId: kuisId);
}

class _QuizRankingPage extends State<QuizRanking> {
  String kuisId;
  String? nama, poin, idSiswa;
  _QuizRankingPage({required this.kuisId});

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
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: (MediaQuery.of(context).size.height),
              width: (MediaQuery.of(context).size.width),
              color: const Color.fromRGBO(38, 37, 37, 1),
              child: Stack(
                children: [
                  // Your other widgets here...
                  
                  //Bronze Medal
                  Positioned(
                    top: 350,
                    right: 70,
                    child: Image.asset('assets/images/bronzemedal.png')),
                    
                  // Your other widgets here...
                ],
              ),
            ),
            Positioned(
              bottom: -120,
              child: Container(
                padding: const EdgeInsets.only(
                    bottom: 30, top: 50, left: 20, right: 20),
                width: (MediaQuery.of(context).size.width) + 150,
                height: (MediaQuery.of(context).size.height) - 300,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.elliptical(270, 200)),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(children: [
                    // Your other widgets here...
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
