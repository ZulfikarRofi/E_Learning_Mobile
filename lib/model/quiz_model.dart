import 'dart:convert';

class QuizModel {
  int? id_kuis;
  int? mapel_id;
  int? kelas_id;
  String? nama_mapel;
  String? nama_kelas;
  String? nama_kuis;
  String? duedate;

  QuizModel({
    this.id_kuis,
    this.mapel_id,
    this.kelas_id,
    this.nama_mapel,
    this.nama_kelas,
    this.nama_kuis,
    this.duedate,
  });

  factory QuizModel.fromJson(Map<String, dynamic> map) {
    return QuizModel(
      id_kuis: map["id_kuis"],
      kelas_id: map["kelas_id"],
      mapel_id: map["mapel_id"],
      nama_mapel: map["nama_mapel"],
      nama_kuis: map["nama_kuis"],
      nama_kelas: map["nama_kelas"],
      duedate: map["duedate"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id_kuis": id_kuis,
      "kelas_id": kelas_id,
      "nama_mapel": nama_mapel,
      "nama_kuis": nama_kuis,
      "nama_kelas": nama_kelas,
      "mapel_id": mapel_id,
      "duedate": duedate,
    };
  }

  @override
  String toString() {
    return 'QuizModel{id_kuis: $id_kuis, kelas_id: $kelas_id, mapel_id: $mapel_id, nama_kuis: $nama_kuis,nama_mapel: $nama_mapel, nama_kelas: $nama_kelas, duedate: $duedate}';
  }
}

List<QuizModel> quizModelFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<QuizModel>.from(data.map((item) => QuizModel.fromJson(item)));
}

String quizModelToJson(QuizModel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
