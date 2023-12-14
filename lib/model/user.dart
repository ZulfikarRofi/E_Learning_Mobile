import 'dart:convert';

class User {
  String? id_user;
  String? name;
  String? email;
  String? password;
  String? level;
  String? status;
  String? siswa_id;

  User({
    this.id_user,
    this.name,
    this.email,
    this.level,
    this.password,
    this.status,
    this.siswa_id,
  });

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      id_user: map["id_user"],
      name: map["name"],
      email: map["email"],
      level: map["level"],
      password: map["password"],
      status: map["status"],
      siswa_id: map["siswa_id"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id_user": id_user,
      "name": name,
      "email": email,
      "password": password,
      "level": level,
      "status": status,
      "siswa_id": siswa_id,
    };
  }

  @override
  String toString() {
    return 'User{id_user: $id_user, name: $name, email: $email, password: $password, level: $level, status: $status, siswa_id: $siswa_id,}';
  }
}

List<User> userFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<User>.from(data.map((item) => User.fromJson(item)));
}

String userToJson(User data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
