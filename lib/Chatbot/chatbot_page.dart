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
  _ChatbotPage createState() => _ChatbotPage(idBot: idBot);
}

class _ChatbotPage extends State<ChatbotPage> {
  String idBot;
  _ChatbotPage({required this.idBot});
  String? id, name, answer_id;
  final now = DateTime.now();

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
      });
    }

    print("${id} Ini ID SISWA!!");
  }

  _postDataTask(String? idAnswer) async {
    EasyLoading.show(
        status: 'Loading....', maskType: EasyLoadingMaskType.black);
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var data = {
      'siswa_id': localStorage.getString("id")!,
      'answer_id': idAnswer
    };

    print(data);
    var res = await ApiService().postData(data, '/postBot');
    var body = jsonDecode(res.body);
    if (body['msg'] != '') {
      EasyLoading.dismiss();

      return getData();
    } else {
      EasyLoading.dismiss();

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Terjadi kesalahan')));
    }
  }

  @override
  Widget build(BuildContext context) {
    String? botName, messageFill, sendTime;

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
                      "Bot-$botName",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: Stack(
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width),
                  height: (MediaQuery.of(context).size.height) - 80.0,
                  padding: const EdgeInsets.only(bottom: 120.0),
                  child: FutureBuilder<List<getFillChats>>(
                    future: ApiService().getChats(),
                    builder:
                        (context, AsyncSnapshot<List<getFillChats>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('Belum Memulai Chat'));
                      } else {
                        List<getFillChats> chats = snapshot.data!;
                        return buildChatListView(chats, name);
                      }
                    },
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
                        top: BorderSide(color: Colors.black, width: 1.0),
                      ),
                    ),
                    child: FutureBuilder<List<botOptions>>(
                      future: ApiService().getBotOptions(1),
                      builder:
                          (context, AsyncSnapshot<List<botOptions>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return const Text('No data available');
                        } else {
                          List<botOptions> botoptions = snapshot.data!;
                          return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              botOptions data = botoptions[index];
                              return MyOptionbot(
                                idOptions: data.id,
                                idBot: data.bot_id,
                                isiText: data.bot_option_text,
                                idAnswer: data.idAnswer,
                                togglePressed: () {
                                  // Call the _postDataTask function when the button is pressed
                                  _postDataTask(data.idAnswer);
                                },
                              );
                            },
                            itemCount: botoptions.length,
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Text('Error: ${snapshot.error}');
        }
      },
    );
  }

  Widget buildChatListView(List<getFillChats> chats, name) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        getFillChats data = chats[index];
        return buildChatItem(data, name);
      },
      itemCount: chats.length,
    );
  }

  Widget buildChatItem(getFillChats data, name) {
    String messageFill = data.message_fill!;
    String sendTime = data.send_time!;

    if (data.message_type == "sender") {
      return PersonChat(
        name: name,
        messageFill: messageFill,
        sendTime: sendTime,
      );
    } else if (data.message_type == "receiver") {
      return BotChat(
        messageFill: messageFill,
        sendTime: sendTime,
      );
    }

    return Container();
  }
}

class MyOptionbot extends StatelessWidget {
  String? idOptions, idBot, isiText, idAnswer;
  final Function() togglePressed;

  MyOptionbot({
    Key? key,
    this.idBot,
    this.idOptions,
    this.isiText,
    this.idAnswer,
    required this.togglePressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            // Set the color based on the state of the button
            if (states.contains(MaterialState.pressed)) {
              return Colors.red; // Color when the button is pressed
            }
            return Colors.blue; // Default color
          },
        ),
      ),
      onPressed: togglePressed,
      child: Flexible(
        child: Text(
          isiText!,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

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
                      sendTime!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      name!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
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
              borderRadius: BorderRadius.circular(25),
            ),
            child: Image.asset('assets/images/icon-male.png'),
          ),
        ],
      ),
    );
  }
}

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
              borderRadius: BorderRadius.circular(25),
            ),
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
                      'Izu',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      sendTime!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
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
          ),
        ],
      ),
    );
  }
}
