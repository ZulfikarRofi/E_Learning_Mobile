import 'dart:convert';

class listChatUser {
  String? id;
  String? idBot;
  String? name;
  String? bot_name;
  String? last_chat;
  String? time;
  int? gap;

  listChatUser({
    this.id,
    this.idBot,
    this.name,
    this.bot_name,
    required this.last_chat,
    this.time,
    this.gap,
  });

  factory listChatUser.fromJson(Map<String, dynamic> map) {
    return listChatUser(
      id: map["id"],
      idBot: map["idBot"],
      name: map["name"],
      bot_name: map["bot_name"],
      last_chat: map["last_chat"],
      time: map["time"],
      gap: map["gap"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "idBot": idBot,
      "name": name,
      "bot_name": bot_name,
      "last_chat": last_chat,
      "time": time,
      "gap": gap,
    };
  }

  @override
  String toString() {
    return 'listChatUser{id: $id,idBot: $idBot, name: $name, bot_name: $bot_name, last_chat: $last_chat, time: $time, gap: $gap}';
  }
}

List<listChatUser> listChatUserFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<listChatUser>.from(
      data.map((item) => listChatUser.fromJson(item)));
}

String listChatUserToJson(listChatUser data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
