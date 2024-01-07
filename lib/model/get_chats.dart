import 'dart:convert';

class getFillChats {
  String? id;
  String? message_fill;
  String? siswa_id;
  String? send_time;
  String? message_number;
  String? message_type;

  getFillChats({
    this.id,
    this.message_fill,
    this.siswa_id,
    this.send_time,
    this.message_number,
    this.message_type,
  });

  factory getFillChats.fromJson(Map<String, dynamic> map) {
    return getFillChats(
        id: map["id"],
        message_fill: map["message_fill"],
        siswa_id: map["siswa_id"],
        send_time: map["send_time"],
        message_number: map["message_number"],
        message_type: map["message_type"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "message_fill": message_fill,
      "siswa_id": siswa_id,
      "send_time": send_time,
      "message_number": message_number,
      "message_type": message_type,
    };
  }

  @override
  String toString() {
    return 'getFillChats{id: $id, message_fill: $message_fill, siswa_id: $siswa_id, send_time: $send_time, message_number: $message_number, message_type: $message_type}';
  }
}

List<getFillChats> getFillChatsFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<getFillChats>.from(
      data.map((item) => getFillChats.fromJson(item)));
}

String getFillChatsToJson(getFillChats data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
