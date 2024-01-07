// ignore_for_file: no_logic_in_create_state

import 'dart:convert';

import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:first_app/api/api.dart';
import 'package:first_app/model/bot_options.dart';
import 'package:first_app/model/get_chats.dart';
import 'package:first_app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class ChatbotPage extends StatefulWidget {
  String idBot;
  ChatbotPage({Key? key, required this.idBot}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChatbotPage createState() => _ChatbotPage(idBot: idBot);
}

class _ChatbotPage extends State<ChatbotPage> {
  String idBot;
  _ChatbotPage({required this.idBot});
  // ignore: unnecessary_new
  String? id, name;
  final now = new DateTime.now();
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
        print("idSiswa : $id");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String? botName, messageFill, sendTime;
    // bool isKosong = false;
    return FutureBuilder(
        future: ApiService().getWhereData('/getBotData', idBot),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> dataBot = json.decode(snapshot.data!);
            botName = dataBot['data']['nama_bot'];
            return Scaffold(
              appBar: AppBar(
                  title: Row(
                children: [
                  Image.asset('assets/images/chatbot.png'),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                        "Bot-$botName"),
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
                                // ignore: unnecessary_new
                                date: DateTime(now.year, now.month, now.day),
                              ),
                            ],
                          ),
                          FutureBuilder<List<getFillChats>>(
                            future: ApiService().getChats(),
                            builder: (context,
                                AsyncSnapshot<List<getFillChats>> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                // While the future is still running
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                // If an error occurred while fetching the data
                                return Text('Error: ${snapshot.error}');
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.isEmpty) {
                                // If no data is available or the data list is empty
                                return const Text('Belum Memulai Chat');
                              } else {
                                // If data is available, you can build your UI using the data from the snapshot
                                List<getFillChats> chats = snapshot.data!;
                                return ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    getFillChats data = chats[index];
                                    messageFill = data.message_fill;
                                    sendTime = data.send_time;
                                    if (data.message_type == "Sender") {
                                      return PersonChat(
                                        name: name,
                                        messageFill: messageFill,
                                        sendTime: sendTime,
                                      );
                                    } else if (data.message_type ==
                                        "Receiver") {
                                      return BotChat(
                                        messageFill: messageFill,
                                        sendTime: sendTime,
                                      );
                                    }
                                    return null;
                                  },
                                  itemCount: chats.length,
                                );
                              }
                            },
                          ),
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
                              top:
                                  BorderSide(color: Colors.black, width: 1.0))),
                      child: FutureBuilder<List<botOptions>>(
                        future: ApiService().getBotOptions(1),
                        builder: ((context,
                            AsyncSnapshot<List<botOptions>> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // While the future is still running
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            // If an error occurred while fetching the data
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            // If no data is available or the data list is empty
                            return const Text('No data available');
                          } else {
                            // If data is available, you can build your UI using the data from the snapshot
                            List<botOptions> botoptions = snapshot.data!;
                            return ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                botOptions data = botoptions[index];
                                // ignore: avoid_print
                                print("$data Data Option");
                                return MyOptionbot(
                                  idOptions: data.id,
                                  idBot: data.bot_id,
                                  isiText: data.bot_option_text,
                                );
                              },
                              itemCount: botoptions.length,
                            );
                          }
                        }),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Text('Error: ${snapshot.error}');
          }
        });
  }
}

//option Bot
// ignore: must_be_immutable
class MyOptionbot extends StatelessWidget {
  _postChat(BuildContext context) async {
    EasyLoading.show(
      status: 'Loading....',
      maskType: EasyLoadingMaskType.black,
    );

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var data = {
      'siswa_id': localStorage.getString("id")!,
      // 'task_id': idTugas,
    };

    var res = await ApiService().postData(data, '/createTask');
    var body = jsonDecode(res.body);

    if (body['msg'] != '') {
      EasyLoading.dismiss();

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(body['msg'])));
    } else {
      EasyLoading.dismiss();

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Terjadi kesalahan')));
    }
  }

  String? idOptions, idBot, isiText;
  MyOptionbot({Key, key, this.idBot, this.idOptions, this.isiText});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 8, 128, 183)),
        child: Flexible(
            child: Text(
          style: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 14),
          isiText!,
        )));
  }
}

// ignore: must_be_immutable
class PersonChat extends StatelessWidget {
  String? messageFill, sendTime, name;
  PersonChat({this.messageFill, this.sendTime, this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                        style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: Colors.grey),
                        sendTime!),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14),
                        name!),
                  ),
                ],
              ),
              BubbleSpecialOne(
                text: messageFill!,
                isSender: true,
                tail: true,
                color: Colors.black,
                textStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.only(top: 10.0),
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

// ignore: must_be_immutable
class BotChat extends StatelessWidget {
  String? messageFill, sendTime;
  BotChat({this.messageFill, this.sendTime});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14),
                        'Izu'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                        style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: Colors.grey),
                        sendTime!),
                  ),
                ],
              ),
              BubbleSpecialOne(
                text: messageFill!,
                isSender: false,
                tail: true,
                color: const Color.fromARGB(255, 235, 235, 235),
                textStyle: const TextStyle(
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
