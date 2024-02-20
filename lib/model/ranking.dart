import 'dart:convert';

class Ranking {
  String? idSiswa;
  String? idKuis;
  String? idNilai;
  String? nama;
  String? skor;

  Ranking({
    this.idSiswa,
    this.idKuis,
    this.idNilai,
    this.nama,
    this.skor,
  });

  factory Ranking.fromJson(Map<String, dynamic> map) {
    return Ranking(
      idSiswa: map["idSiswa"],
      idKuis: map["idKuis"],
      idNilai: map["idNilai"],
      nama: map["nama"],
      skor: map["skor"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "idSiswa": idSiswa,
      "idKuis": idKuis,
      "idNilai": idNilai,
      "nama": nama,
      "skor": skor,
    };
  }

  @override
  String toString() {
    return 'Ranking{idSiswa: $idSiswa, idKuis: $idKuis, idNilai: $idNilai, nama: $nama, skor: $skor}';
  }
}

List<Ranking> rankingFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Ranking>.from(data.map((item) => Ranking.fromJson(item)));
}

String rankingToJson(Ranking data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
