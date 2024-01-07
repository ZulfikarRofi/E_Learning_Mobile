import 'dart:convert';

class botOptions {
  String? id;
  String? bot_id;
  String? bot_option_text;
  String? idAnswer;

  botOptions({
    this.id,
    this.bot_id,
    this.bot_option_text,
    this.idAnswer,
  });

  factory botOptions.fromJson(Map<String, dynamic> map) {
    return botOptions(
        id: map["id"],
        bot_id: map["bot_id"],
        bot_option_text: map["bot_option_text"],
        idAnswer: map["idAnswer"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "bot_id": bot_id,
      "bot_option_text": bot_option_text,
      "idAnswer": idAnswer,
    };
  }

  @override
  String toString() {
    return 'botOptions{id: $id, bot_id: $bot_id, bot_option_text:$bot_option_text,  idAnswer:$idAnswer}';
  }
}

List<botOptions> botOptionsFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<botOptions>.from(data.map((item) => botOptions.fromJson(item)));
}

String botOptionsToJson(botOptions data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
