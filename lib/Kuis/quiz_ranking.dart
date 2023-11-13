import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class QuizRanking extends StatefulWidget {
  const QuizRanking({Key? key}) : super(key: key);

  @override
  _QuizRankingPage createState() => _QuizRankingPage();
}

class _QuizRankingPage extends State<QuizRanking> {
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
                    //Decoration
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
                        top: 130,
                        left: -60,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(50, 50, 50, 1),
                              borderRadius: BorderRadius.circular(60)),
                        )),
                    Positioned(
                        top: 370,
                        left: 10,
                        child: Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(50, 50, 50, 1),
                              borderRadius: BorderRadius.circular(23)),
                        )),
                    Positioned(
                        top: 130,
                        right: 60,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(50, 50, 50, 1),
                              borderRadius: BorderRadius.circular(20)),
                        )),
                    Positioned(
                        top: 300,
                        right: -60,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(50, 50, 50, 1),
                              borderRadius: BorderRadius.circular(60)),
                        )),
                    //Ranking Position
                    Positioned(
                        top: 290,
                        right: 50,
                        child: Container(
                          width: 85,
                          height: 85,
                          decoration: BoxDecoration(
                              color: Colors.lightBlue[200],
                              borderRadius: BorderRadius.circular(60)),
                        )),
                    //Bronze Medal
                    Positioned(
                        top: 350,
                        right: 70,
                        child: Image.asset('assets/images/bronzemedal.png')),
                    Positioned(
                        top: 290,
                        left: 50,
                        child: Container(
                          width: 85,
                          height: 85,
                          decoration: BoxDecoration(
                              color: Colors.lightBlue[200],
                              borderRadius: BorderRadius.circular(60)),
                        )),
                    //Silver Medal
                    Positioned(
                        top: 350,
                        left: 70,
                        child: Image.asset('assets/images/silvermedal.png')),
                    Positioned(
                        top: 210,
                        left: 132,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              color: Colors.lightBlue[200],
                              borderRadius: BorderRadius.circular(60)),
                          child: Image.asset(
                            'assets/images/icon-male.png',
                            scale: 1.0,
                          ),
                        )),
                    Positioned(
                        top: 330,
                        left: 140,
                        child: Container(
                            width: 100.0,
                            child: const Column(
                              children: [
                                Text(
                                  'Budi',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '70 pts',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ))),
                    //Crown
                    Positioned(
                        top: 160,
                        left: 162,
                        child: Image.asset(
                          'assets/images/crownn.png',
                          scale: 9.0,
                        )),
                    //Button Switch
                    Positioned(
                      top: 90,
                      left: 55,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        width: 280.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color.fromARGB(255, 234, 234, 234),
                        ),
                        child: ToggleSwitch(
                          minWidth: 135.0,
                          minHeight: 60.0,
                          fontSize: 18,
                          cornerRadius: 80,
                          activeBgColor: const [Colors.black],
                          activeFgColor: Colors.white,
                          inactiveBgColor:
                              const Color.fromARGB(255, 234, 234, 234),
                          inactiveFgColor: Colors.grey,
                          initialLabelIndex: 0,
                          radiusStyle: true,
                          totalSwitches: 2,
                          labels: const ['Quiz', 'Kelas'],
                          onToggle: (index) {
                            print('switched to: $index');
                          },
                        ),
                      ),
                    ),
                  ],
                )),
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
                    // MyRankings(),
                    // MyRankings(),
                    // MyRankings(),
                    // MyRankings(),
                    // MyRankings(),
                    // MyRankings(),
                    // MyRankings(),
                    // MyRankings(),
                    // MyRankings(),
                    // MyRankings(),
                    // MyRankings(),
                    // MyRankings(),
                    // MyRankings(),
                    // MyRankings(),
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

class MyRankings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      width: 360,
      // height: 65,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              '4.'),
          Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                padding: const EdgeInsets.all(8),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.lightBlue[200]),
                child: Image.asset('assets/images/murid.png'),
              )),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                'Nicholas Gross'),
          ),
          const Spacer(),
          const Text(
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              '400 pts'),
        ],
      ),
    );
  }
}
