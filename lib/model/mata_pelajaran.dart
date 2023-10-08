import 'dart:convert';

class MataPelajaran {
  int? id_mapel;
  int? kelas_id;
  int? guru_id;
  String? nama_mapel;
  String? mapel_id;
  String? deskripsi;
  String? hari_pelajaran;
  String? jam_pelajaran;

  MataPelajaran({
    this.id_mapel,
    this.kelas_id,
    this.guru_id,
    this.nama_mapel,
    this.mapel_id,
    this.deskripsi,
    this.hari_pelajaran,
    this.jam_pelajaran,
  });

  factory MataPelajaran.fromJson(Map<String, dynamic> map) {
    return MataPelajaran(
        id_mapel: map["id_mapel"],
        kelas_id: map["kelas_id"],
        guru_id: map["guru_id"],
        nama_mapel: map["nama_mapel"],
        mapel_id: map["mapel_id"],
        deskripsi: map["deskripsi"],
        hari_pelajaran: map["hari_pelajaran"],
        jam_pelajaran: map["jam_pelajaran"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id_mapel": id_mapel,
      "kelas_id": kelas_id,
      "guru_id": guru_id,
      "nama_mapel": nama_mapel,
      "mapel_id": mapel_id,
      "deskripsi": deskripsi,
      "hari_pelajaran": hari_pelajaran,
      "jam_pelajaran": jam_pelajaran,
    };
  }

  @override
  String toString() {
    return 'MataPelajaran{id_mapel: $id_mapel, kelas_id: $kelas_id, guru_id: $guru_id, nama_mapel: $nama_mapel, mapel_id: $mapel_id, deskripsi: $deskripsi, hari_pelajaran: $hari_pelajaran, jam_pelajaran: $jam_pelajaran,}';
  }
}

List<MataPelajaran> mapelFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<MataPelajaran>.from(data.map((item) => MataPelajaran));
}

String mapelToJson(MataPelajaran data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
