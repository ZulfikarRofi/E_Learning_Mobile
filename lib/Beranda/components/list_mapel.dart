import 'package:first_app/Siswa/detail_kelas.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class ListMapel extends StatelessWidget {
  double progress;
  final String? idMapel, namaMapel, namaGuru, totalMateri;
  ListMapel({
    Key,
    key,
    this.idMapel,
    this.namaMapel,
    this.namaGuru,
    this.totalMateri,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: () {
          // Navigator.pushNamed(context, '/detail_kelas');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailKelas(idMapel: idMapel),
            ),
          );
        },
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: SizedBox(
          width: 250,
          height: 238,
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
                      child: SizedBox(
                        width: 200,
                        child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                            namaMapel!
                            // 'Matematika',
                            ),
                      ),
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
                        children: [
                          Image.asset(
                            'assets/images/icon-male.png',
                            scale: 5.0,
                          )
                        ],
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
                          valueNotifier: ValueNotifier(progress),
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
                          Container(
                            padding: const EdgeInsets.only(right: 8),
                            child: Image.asset(
                              'assets/images/guru.png',
                              scale: 4.0,
                            ),
                          ),
                          SizedBox(
                            width: 100.0,
                            child: Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.grey),
                                // 'Pak Marsono'
                                namaGuru!),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 2),
                            child: Image.asset('assets/images/clipboard.png'),
                          ),
                          Text(
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.grey),
                              "${idMapel!} materi"),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
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
