import 'dart:convert';

import 'package:first_app/Chatbot/chatbot_page.dart';
import 'package:first_app/api/api.dart';
import 'package:first_app/model/list_chatusers.dart';
import 'package:first_app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListChatbot extends StatefulWidget {
  const ListChatbot({Key? key}) : super(key: key);

  @override
  _ListChatbot createState() => _ListChatbot();
}

class _ListChatbot extends State<ListChatbot> {
  String? id = '';
  String? name = '';
  String? idSiswa = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    if (localStorage.getString("id") != null) {
      setState(() {
        var sessUser = localStorage.getString("user");
        var dat = jsonDecode(sessUser.toString());
        User user = User.fromJson(dat[0]);
        id = localStorage.getString("id")!;
        name = user.name.toString();
        idSiswa = user.siswa_id.toString();
        // print('idSiswa :' + idSiswa);
      });
    }
  }

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
              FutureBuilder<List<listChatUser>>(
                future: ApiService().listChat(idSiswa),
                builder:
                    ((context, AsyncSnapshot<List<listChatUser>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // While the future is still running
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    // If an error occurred while fetching the data
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    // If no data is available or the data list is empty
                    return const Text('No data available');
                  } else {
                    // If data is available, you can build your UI using the data from the snapshot
                    List<listChatUser> chats = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        listChatUser data = chats[index];
                        print("$data ini data bot");
                        return MyChat(
                          idChat: data.id.toString(),
                          idBot: data.idBot.toString(),
                          name: data.name,
                          botName: data.bot_name,
                          time: data.time,
                          lastChat: data.last_chat,
                          gap: data.gap.toString(),
                        );
                      },
                      itemCount: chats.length,
                    );
                  }
                }),
              ),
            ],
          ),
        ));
  }
}

// ignore: must_be_immutable
class MyChat extends StatelessWidget {
  String? idChat, name, botName, time, gap, lastChat;
  String idBot;
  MyChat(
      {Key,
      key,
      this.idChat,
      required this.idBot,
      this.name,
      this.botName,
      this.gap,
      required this.lastChat,
      this.time})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatbotPage(idBot: idBot),
              ),
            );
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
            child: Row(
              children: [
                Container(
                    padding: const EdgeInsets.all(10),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 196, 208, 255),
                        borderRadius: BorderRadius.circular(25)),
                    child: Image.asset('assets/images/chatbot.png')),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  width: 200.0,
                  height: 70.0,
                  child: Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.black),
                            botName!),
                        Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: Color.fromRGBO(0, 0, 0, 1)),
                            lastChat!)
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                  color: Colors.black),
                              'Last Seen'),
                          Text(
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                  color: Colors.black),
                              // '08:30'
                              time!)
                        ]))
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
