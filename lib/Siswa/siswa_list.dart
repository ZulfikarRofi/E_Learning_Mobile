import 'package:flutter/material.dart';

class SiswaList extends StatefulWidget {
  const SiswaList({Key? key}) : super(key: key);

  @override
  _SiswaListPage createState() => _SiswaListPage();
}

class _SiswaListPage extends State<SiswaList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: SizedBox(
                width: 60,
                height: 50,
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(50)),
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 20.0,
                        ),
                        label: const Text(''))))),
        body: SingleChildScrollView(
            child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 30,
                left: 20,
                right: 20,
              ),
              child: Row(
                children: [
                  Text(
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                      'Daftar Siswa'),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  direction: Axis.horizontal,
                  children: [
                    MySiswaWidget(),
                    MySiswaWidget(),
                    MySiswaWidget(),
                    MySiswaWidget(),
                    MySiswaWidget(),
                    MySiswaWidget(),
                    MySiswaWidget(),
                    MySiswaWidget(),
                    MySiswaWidget(),
                    MySiswaWidget(),
                    MySiswaWidget(),
                    MySiswaWidget(),
                    MySiswaWidget(),
                    MySiswaWidget(),
                    MySiswaWidget(),
                    MySiswaWidget(),
                    MySiswaWidget(),
                    MySiswaWidget(),
                  ],
                ))
          ],
        )));
  }
}

class MySiswaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(2, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.lightBlue[200],
                  borderRadius: BorderRadius.circular(35)),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Image.asset(scale: 0.1, 'assets/images/murid.png'),
              )),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          const Flexible(
              child: Text(
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  'Chansey'))
        ],
      ),
    );
  }
}
