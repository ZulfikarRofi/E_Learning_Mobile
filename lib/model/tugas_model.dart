import 'dart:convert';

class Task {
  int? id;
  int? mapel_id;
  int? kelas_id;
  String? nama_mapel;
  String? nama_kelas;
  String? nama_tugas;
  String? due_date;

  Task({
    this.id,
    this.mapel_id,
    this.kelas_id,
    this.nama_mapel,
    this.nama_kelas,
    this.nama_tugas,
    this.due_date,
  });

  factory Task.fromJson(Map<String, dynamic> map) {
    return Task(
      id: map["id"],
      kelas_id: map["kelas_id"],
      mapel_id: map["mapel_id"],
      nama_mapel: map["nama_mapel"],
      nama_tugas: map["nama_tugas"],
      nama_kelas: map["nama_kelas"],
      due_date: map["due_date"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "kelas_id": kelas_id,
      "nama_mapel": nama_mapel,
      "nama_tugas": nama_tugas,
      "nama_kelas": nama_kelas,
      "mapel_id": mapel_id,
      "due_date": due_date,
    };
  }

  @override
  String toString() {
    return 'Task{id: $id, kelas_id: $kelas_id, mapel_id: $mapel_id, nama_tugas: $nama_tugas,nama_mapel: $nama_mapel, nama_kelas: $nama_kelas, due_date: $due_date}';
  }
}

List<Task> taskFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Task>.from(data.map((item) => Task.fromJson(item)));
}

String taskToJson(Task data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
