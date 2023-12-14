import 'dart:convert';

class MataPelajaran {
  String? id;
  String? kelas_id;
  String? guru_id;
  String? nama_mapel;
  String? nama_guru;
  String? mapel_id;
  String? deskripsi;
  String? hari_pelajaran;
  String? jam_pelajaran;
  String progress;

  MataPelajaran({
    this.id,
    this.kelas_id,
    this.guru_id,
    this.nama_mapel,
    this.nama_guru,
    this.mapel_id,
    this.deskripsi,
    this.hari_pelajaran,
    this.jam_pelajaran,
    required this.progress,
  });

  factory MataPelajaran.fromJson(Map<String, dynamic> map) {
    return MataPelajaran(
        id: map["id"],
        kelas_id: map["kelas_id"],
        guru_id: map["guru_id"],
        nama_guru: map["nama_guru"],
        nama_mapel: map["nama_mapel"],
        mapel_id: map["mapel_id"],
        deskripsi: map["deskripsi"],
        hari_pelajaran: map["hari_pelajaran"],
        jam_pelajaran: map["jam_pelajaran"],
        progress: map["progress"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "kelas_id": kelas_id,
      "guru_id": guru_id,
      "nama_guru": nama_guru,
      "nama_mapel": nama_mapel,
      "mapel_id": mapel_id,
      "deskripsi": deskripsi,
      "hari_pelajaran": hari_pelajaran,
      "jam_pelajaran": jam_pelajaran,
      "progress": progress,
    };
  }

  @override
  String toString() {
    return 'MataPelajaran{id: $id, kelas_id: $kelas_id, guru_id: $guru_id, nama_guru: $nama_guru,nama_mapel: $nama_mapel, mapel_id: $mapel_id, deskripsi: $deskripsi, hari_pelajaran: $hari_pelajaran, jam_pelajaran: $jam_pelajaran, progress:$progress}';
  }
}

List<MataPelajaran> mapelFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<MataPelajaran>.from(
      data.map((item) => MataPelajaran.fromJson(item)));
}

String mapelToJson(MataPelajaran data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
