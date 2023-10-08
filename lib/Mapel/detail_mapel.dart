import 'package:flutter/material.dart';

class DetailMapel extends StatefulWidget {
  const DetailMapel({Key? key}) : super(key: key);

  @override
  _DetailMapelPage createState() => _DetailMapelPage();
}

class _DetailMapelPage extends State<DetailMapel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Row(children: [
          Flexible(
              child: Text(
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  '1. Asal Usul Perang Diponegoro')),
        ])),
        body: SingleChildScrollView(
          child: Column(
            children: [
              DetailMateri(),
            ],
          ),
        ));
  }
}

class DetailMateri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
