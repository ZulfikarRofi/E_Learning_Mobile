import 'dart:convert';

import 'package:flutter/material.dart';

class DataSiswa {
  int? id_siswa;
  int? kelas_id;
  String? name;
  String? photo;
  String? jenis_kelamin;
  String? nama_kelas;

  DataSiswa({
    this.id_siswa,
    this.kelas_id,
    this.name,
    this.photo,
    this.jenis_kelamin,
    this.nama_kelas,
  });

  factory DataSiswa.fromJson(Map<String, dynamic> map) {
    return DataSiswa(
      id_siswa: map["id_siswa"],
      kelas_id: map["kelas_id"],
      name: map["name"],
      photo: map["photo"],
      jenis_kelamin: map["jenis_kelamin"],
      nama_kelas: map["nama_kelas"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id_siswa": id_siswa,
      "kelas_id": kelas_id,
      "name": name,
      "photo": photo,
      "jenis_kelamin": jenis_kelamin,
      "nama_kelas": nama_kelas,
    };
  }

  @override
  String toString() {
    return 'DataSiswa{id_siswa:$id_siswa, kelas_id:$kelas_id, name:$name, photo:$photo, jenis_kelamin:$jenis_kelamin, nama_kelas:$nama_kelas}';
  }

  List<DataSiswa> dataSiswaFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return List<DataSiswa>.from(data.map((item) => DataSiswa));
  }

  String dataSiswaToJson(DataSiswa data) {
    final jsonData = data.toJson();
    return json.encode(jsonData);
  }
}

class CardMapel {
  int? id_mapel;
  int? guru_id;
  String? nama_mapel;
  String? nama_guru;
  int? total_modul;

  CardMapel({
    this.id_mapel,
    this.guru_id,
    this.nama_mapel,
    this.nama_guru,
    this.total_modul,
  });

  factory CardMapel.fromJson(Map<String, dynamic> map) {
    return CardMapel(
      id_mapel: map["id_mapel"],
      guru_id: map["guru_id"],
      nama_mapel: map["nama_mapel"],
      nama_guru: map["nama_guru"],
      total_modul: map["total_modul"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id_mapel": id_mapel,
      "guru_id": guru_id,
      "nama_mapel": nama_mapel,
      "nama_guru": nama_guru,
      "total_modul": total_modul,
    };
  }

  @override
  String toString() {
    return 'CardMapel{id_mapel:$id_mapel, guru_id:$guru_id, nama_mapel:$nama_mapel, nama_guru:$nama_guru, total_modul:$total_modul}';
  }

  List<CardMapel> cardMapelFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return List<CardMapel>.from(data.map((item) => CardMapel));
  }

  String cardMapelToJson(CardMapel data) {
    final jsonData = data.toJson();
    return json.encode(jsonData);
  }
}

class CardTask {
  int? id_task;
  int? mapel_id;
  int? kelas_id;
  String? nama_tugas;
  String? nama_kelas;
  String? nama_mapel;
  String? due_date;

  CardTask({
    this.id_task,
    this.mapel_id,
    this.kelas_id,
    this.nama_kelas,
    this.nama_mapel,
    this.nama_tugas,
    this.due_date,
  });

  factory CardTask.fromJson(Map<String, dynamic> map) {
    return CardTask(
      id_task: map["id_task"],
      mapel_id: map["mapel_id"],
      nama_mapel: map["nama_mapel"],
      nama_tugas: map["nama_tugas"],
      nama_kelas: map["nama_kelas"],
      due_date: map["due_date"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id_task": id_task,
      "mapel_id": mapel_id,
      "nama_mapel": nama_mapel,
      "nama_tugas": nama_tugas,
      "nama_kelas": nama_kelas,
      "due_date": due_date,
    };
  }

  @override
  String toString() {
    return 'CardMapel{id_task:$id_task, mapel_id:$mapel_id, nama_mapel:$nama_mapel, nama_tugas:$nama_tugas, nama_kelas:$nama_kelas, due_date:$due_date}';
  }

  List<CardTask> cardTaskFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return List<CardTask>.from(data.map((item) => CardTask));
  }

  String cardTaskToJson(CardTask data) {
    final jsonData = data.toJson();
    return json.encode(jsonData);
  }
}
