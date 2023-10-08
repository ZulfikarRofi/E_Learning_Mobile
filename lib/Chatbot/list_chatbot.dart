import 'package:flutter/material.dart';

class ListChatbot extends StatefulWidget {
  const ListChatbot({Key? key}) : super(key: key);

  @override
  _ListChatbot createState() => _ListChatbot();
}

class _ListChatbot extends State<ListChatbot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                const Text(
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                    'Daftar Chatbot'),
                const Spacer(),
                MaterialButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.search,
                      size: 30.0,
                    ))
              ],
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyChat(),
              MyChat(),
              MyChat(),
              MyChat(),
              MyChat(),
              MyChat(),
              MyChat(),
              MyChat(),
              MyChat(),
              MyChat(),
              MyChat(),
              MyChat(),
            ],
          ),
        ));
  }
}

class MyChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/chatbot');
          },
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          child: Container(
            width: 360,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(
                border: Border(
                    // top: BorderSide(color: Colors.grey, width: 1.0),
                    bottom: BorderSide(color: Colors.grey, width: 0.3))),
            child: Stack(
              children: [
                Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(10),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 70, 5, 1),
                            borderRadius: BorderRadius.circular(25)),
                        child: Image.asset('assets/images/murid.png')),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Colors.black),
                              'Chatbot Izu-Matematika'),
                          Text(
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  color: Colors.black),
                              'Textttttttttttttttttttttttttttt')
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                      color: Colors.black),
                                  'Last Seen'),
                              Text(
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                      color: Colors.black),
                                  '08:30')
                            ]))
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        // const Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        //   child: TextField(
        //     decoration: InputDecoration(
        //       filled: true,
        //       fillColor: Color.fromARGB(255, 234, 234, 234),
        //       prefixIcon: Icon(Icons.search),
        //       border: OutlineInputBorder(),
        //       hintText: 'Masukkan nama bot',
        //       labelText: 'Cari Bot',
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
