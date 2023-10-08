// import 'package:first_app/Chatbot/chat_bubble.dart';
// import 'package:first_app/Kuis/components/confetti.dart';
import 'package:first_app/Kuis/components/confetti.dart';
import 'package:flutter/material.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(50),
          color: Colors.black,
          child: const ConfettiClass()),
    );
  }
}
