import 'dart:convert';

class Dailytask {
  int? id;
  int? mapel_id;
  int? kelas_id;
  int? guru_id;
  String? nama_guru;
  String? jam_pelajaran;
  String? nama_mapel;
  String? nama_kelas;
  String? nama_tugas;
  String? jam_masuk;
  String? jam_akhir;
  String? due_date;

  Dailytask({
    this.id,
    this.mapel_id,
    this.kelas_id,
    this.guru_id,
    this.nama_guru,
    this.jam_pelajaran,
    this.nama_mapel,
    this.nama_kelas,
    this.jam_akhir,
    this.jam_masuk,
    this.nama_tugas,
    this.due_date,
  });

  factory Dailytask.fromJson(Map<String, dynamic> map) {
    return Dailytask(
      id: map["id"],
      kelas_id: map["kelas_id"],
      guru_id: map["guru_id"],
      mapel_id: map["mapel_id"],
      jam_pelajaran: map["jam_pelajaran"],
      nama_mapel: map["nama_mapel"],
      nama_guru: map["nama_guru"],
      nama_tugas: map["nama_tugas"],
      nama_kelas: map["nama_kelas"],
      jam_masuk: map["jam_masuk"],
      jam_akhir: map["jam_akhir"],
      due_date: map["due_date"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "kelas_id": kelas_id,
      "guru_id": guru_id,
      "nama_mapel": nama_mapel,
      "nama_guru": nama_guru,
      "nama_tugas": nama_tugas,
      "nama_kelas": nama_kelas,
      "jam_pelajaran": jam_pelajaran,
      "mapel_id": mapel_id,
      "jam_masuk": jam_masuk,
      "jam_akhir": jam_akhir,
      "due_date": due_date,
    };
  }

  @override
  String toString() {
    return 'Task{id: $id, kelas_id: $kelas_id, guru_id: $guru_id, mapel_id: $mapel_id, nama_tugas: $nama_tugas,nama_guru: $nama_guru, nama_mapel: $nama_mapel,jam_pelajaran: $jam_pelajaran , nama_kelas: $nama_kelas, due_date: $due_date, jam_masuk: $jam_masuk, jam_akhir: $jam_akhir}';
  }
}

List<Dailytask> dailytaskFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Dailytask>.from(data.map((item) => Dailytask.fromJson(item)));
}

String dailytaskToJson(Dailytask data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
