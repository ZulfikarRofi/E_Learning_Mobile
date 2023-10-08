import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class ListMapel extends StatelessWidget {
  ValueNotifier<double> valueNotifier = ValueNotifier(75.0);
  final String? namaMapel, namaGuru, totalMateri;
  ListMapel({
    Key,
    key,
    this.namaMapel,
    this.namaGuru,
    this.totalMateri,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/detail_mapel');
        },
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: SizedBox(
          width: 240,
          height: 250,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 5,
                    offset: const Offset(0, 5),
                  )
                ],
                color: Colors.white),
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(252, 218, 149, 1)),
                          child: Image.asset('assets/images/pen.png'),
                        ),
                      ),
                      const Spacer(),
                      Image.asset('assets/images/threedots.png')
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      child: SizedBox(
                          width: 150,
                          child: Text(
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                              namaMapel!)),
                    ),
                  ],
                ),
                const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Text(
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                            'Daftar Murid :'),
                        Spacer(),
                        Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Text(
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                                'Progress :')),
                      ],
                    )),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [Image.asset('assets/images/gamerr.png')],
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.only(right: 10),
                        child: SimpleCircularProgressBar(
                          animationDuration: 2,
                          size: 33,
                          progressStrokeWidth: 5.0,
                          backStrokeWidth: 5.0,
                          progressColors: const [
                            Color.fromARGB(255, 255, 162, 1),
                            Colors.lightGreen,
                            Colors.lightBlue
                          ],
                          valueNotifier: valueNotifier,
                          mergeMode: true,
                          onGetText: (double value) {
                            return Text(
                              '${value.toInt()}%',
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey, width: 1.0))),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Image.asset('assets/images/teacher.png'),
                          ),
                          const Text(
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.grey),
                              'Pak Marsono'),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 2),
                            child: Image.asset('assets/images/clipboard.png'),
                          ),
                          const Text(
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.grey),
                              '20 Materi'),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 300,
                  height: 5,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(252, 218, 149, 1)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
