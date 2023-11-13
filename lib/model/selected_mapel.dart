import 'dart:convert';

class SelectedMapel {
  int? id_mapel;
  int? kelas_id;
  int? guru_id;
  String? nama_mapel;
  String? nama_guru;
  String? mapel_id;
  String? deskripsi;
  String? hari_pelajaran;
  String? jam_pelajaran;
  String? progress;

  SelectedMapel({
    this.id_mapel,
    this.kelas_id,
    this.guru_id,
    this.nama_mapel,
    this.nama_guru,
    this.mapel_id,
    this.deskripsi,
    this.hari_pelajaran,
    this.jam_pelajaran,
    this.progress,
  });

  factory SelectedMapel.fromJson(Map<String, dynamic> json) {
    return SelectedMapel(
        id_mapel: json["id_mapel"],
        kelas_id: json["kelas_id"],
        guru_id: json["guru_id"],
        nama_guru: json["nama_guru"],
        nama_mapel: json["nama_mapel"],
        mapel_id: json["mapel_id"],
        deskripsi: json["deskripsi"],
        hari_pelajaran: json["hari_pelajaran"],
        jam_pelajaran: json["jam_pelajaran"],
        progress: json["progress"]);
  }
}
