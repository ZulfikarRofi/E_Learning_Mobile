import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({Key? key}) : super(key: key);

  @override
  _ChatbotPage createState() => _ChatbotPage();
}

class _ChatbotPage extends State<ChatbotPage> {
  final now = new DateTime.now();
  @override
  Widget build(BuildContext context) {
    // bool isKosong = false;

    return Scaffold(
        appBar: AppBar(
            title: Row(
          children: [
            Image.asset('assets/images/chatbot.png'),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  'Chatbot Izu'),
            )
          ],
        )),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 120),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DateChip(
                          color: Colors.grey,
                          date: new DateTime(now.year, now.month, now.day),
                        ),
                      ],
                    ),
                    BotChat(),
                    PersonChat(),
                    BotChatt(),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: 385,
                height: 120,
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.black, width: 1.0))),
                child: SingleChildScrollView(
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                    scrollDirection: Axis.vertical,
                    child: Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      direction: Axis.horizontal,
                      children: [
                        MyOptionbot(),
                        MyOptionbott(),
                        MyOptionbott(),
                      ],
                    )),
              ),
            )
          ],
        ));
  }
}

//option Bot
class MyOptionbot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 8, 128, 183)),
        child: const Flexible(
          child: Text(
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 14),
              'Bab 1. Apa pengertian aljabar dan bagaimana penerapannya dalam matematika ?'),
        ));
  }
}

class PersonChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: Colors.grey),
                        '06.00 AM'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14),
                        'Chansey'),
                  ),
                ],
              ),
              BubbleSpecialOne(
                text: 'Apa itu Matematika ?',
                isSender: true,
                tail: true,
                color: Colors.black,
                textStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.white),
                color: const Color.fromARGB(255, 160, 210, 233),
                borderRadius: BorderRadius.circular(25)),
            child: Image.asset('assets/images/icon-male.png'),
          ),
        ],
      ),
    );
  }
}

class BotChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.only(left: 10, right: 0),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.grey),
                color: const Color.fromARGB(255, 215, 215, 215),
                borderRadius: BorderRadius.circular(25)),
            child: Image.asset('assets/images/chatbot.png'),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14),
                        'Izu'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: Colors.grey),
                        '06.00 AM'),
                  ),
                ],
              ),
              BubbleSpecialOne(
                text:
                    'Hai Namaku Izu, aku chatbot yang akan membantumu, mau tanya tentang apa hari ini ?',
                isSender: false,
                tail: true,
                color: Color.fromARGB(255, 235, 235, 235),
                textStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BotChatt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.only(left: 10, right: 0),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.grey),
                color: const Color.fromARGB(255, 215, 215, 215),
                borderRadius: BorderRadius.circular(25)),
            child: Image.asset('assets/images/chatbot.png'),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14),
                        'Izu'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: Colors.grey),
                        '06.01 AM'),
                  ),
                ],
              ),
              BubbleSpecialOne(
                text:
                    'Matematika adalah ilmu yang berkaitan dengan angka, besaran, struktur, ruang, dan pola. Ini adalah disiplin ilmu yang mempelajari hubungan antara objek-objek matematis dan aturan-aturan yang mengatur mereka. Matematika memiliki peran penting dalam pemahaman dan memodelkan fenomena alam, ilmu pengetahuan, teknologi, ekonomi, dan berbagai bidang lainnya.',
                isSender: false,
                tail: true,
                color: Color.fromARGB(255, 235, 235, 235),
                textStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MyOptionbott extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 170,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.black),
        child: const Flexible(
          child: Text(
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 14),
              'Bab 1. Berikan contoh rumus aljabar !'),
        ));
  }
}

class MyOptionbottt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 130,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.pink[300]),
        child: const Flexible(
          child: Text(
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 14),
              'Bab 1. Berikan saya rangkuman materi bab 1 tentang pengertian aljabar'),
        ));
  }
}

class MyOptionbotttt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.green[300]),
        child: const Flexible(
          child: Text(
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 14),
              'Looooooooooooooooooooooooooooooooooong Text'),
        ));
  }
}
