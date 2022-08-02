class UserModel {
  bool? status;
  List<UserM>? data;

  UserModel({this.status, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <UserM>[];
      json['data'].forEach((v) {
        data!.add(UserM.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserM {
  String? idAkun;
  String? nama;
  String? email;
  String? password;
  String? level;
  String? foto;

  UserM(
      {this.idAkun,
      this.nama,
      this.email,
      this.password,
      this.level,
      this.foto});

  UserM.fromJson(Map<String, dynamic> json) {
    idAkun = json['id_akun'];
    nama = json['nama'];
    email = json['email'];
    password = json['password'];
    level = json['level'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_akun'] = idAkun;
    data['nama'] = nama;
    data['email'] = email;
    data['password'] = password;
    data['level'] = level;
    data['foto'] = foto;
    return data;
  }
}
