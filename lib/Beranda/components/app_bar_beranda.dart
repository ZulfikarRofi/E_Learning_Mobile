import 'package:flutter/material.dart';

class BerandaNavWidget extends StatefulWidget {
  const BerandaNavWidget({Key? key}) : super(key: key);

  @override
  _BerandaNavWidgetState createState() => _BerandaNavWidgetState();
}

class _BerandaNavWidgetState extends State<BerandaNavWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Image.asset(
                'assets/images/gamer.png',
              ),
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                      'Hai, Ali Husni !'),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 12),
                        'Kelas VI')),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: 40,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey, // Set border color
                        width: 1.0),
                    borderRadius: BorderRadius.circular(25)),
                padding: const EdgeInsets.all(10),
                child: Image.asset('assets/images/bell.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
