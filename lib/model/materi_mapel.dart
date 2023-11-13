import 'dart:convert';

class materiMapel {
  int? id;
  String? modul_number;
  String? tanggal_regis;
  String? jam_regis;
  int? kelas_id;
  int? mapel_id;
  int? guru_id;
  String? nama_mapel;
  String? nama_modul;
  String? nama_kelas;
  String? nama_guru;

  materiMapel({
    this.id,
    this.mapel_id,
    this.kelas_id,
    this.nama_mapel,
    this.nama_kelas,
    this.nama_guru,
    this.nama_modul,
    this.modul_number,
    this.tanggal_regis,
    this.jam_regis,
  });

  factory materiMapel.fromJson(Map<String, dynamic> map) {
    return materiMapel(
      id: map["id"],
      kelas_id: map["kelas_id"],
      mapel_id: map["mapel_id"],
      nama_mapel: map["nama_mapel"],
      nama_guru: map["nama_guru"],
      nama_modul: map["nama_modul"],
      nama_kelas: map["nama_kelas"],
      modul_number: map["modul_number"],
      tanggal_regis: map["tanggal_regis"],
      jam_regis: map["jam_regis"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "kelas_id": kelas_id,
      "nama_mapel": nama_mapel,
      "nama_guru": nama_guru,
      "nama_kelas": nama_kelas,
      "nama_modul": nama_modul,
      "mapel_id": mapel_id,
      "modul_number": modul_number,
      "tanggal_regis": tanggal_regis,
    };
  }

  @override
  String toString() {
    return 'materiMapel{id: $id, kelas_id: $kelas_id, mapel_id: $mapel_id, nama_guru: $nama_guru,nama_mapel: $nama_mapel, nama_kelas: $nama_kelas, nama_modul: $nama_modul, modul_number: $modul_number, tanggal_regis: $tanggal_regis, jam_regis: $jam_regis}';
  }
}

List<materiMapel> materiMapelFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<materiMapel>.from(data.map((item) => materiMapel.fromJson(item)));
}

String materiMapelToJson(materiMapel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
