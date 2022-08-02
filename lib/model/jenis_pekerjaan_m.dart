// To parse this JSON data, do
//
//     final jenispekerjaanM = jenispekerjaanMFromJson(jsonString);

import 'dart:convert';

JenispekerjaanM jenispekerjaanMFromJson(String str) =>
    JenispekerjaanM.fromJson(json.decode(str));

String jenispekerjaanMToJson(JenispekerjaanM data) =>
    json.encode(data.toJson());

class JenispekerjaanM {
  JenispekerjaanM({
    this.status,
    this.data,
  });

  bool? status;
  List<JenisPekerjaan>? data;

  factory JenispekerjaanM.fromJson(Map<String, dynamic> json) =>
      JenispekerjaanM(
        status: json["status"],
        data: List<JenisPekerjaan>.from(
            json["data"].map((x) => JenisPekerjaan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class JenisPekerjaan {
  JenisPekerjaan({
    this.idJenis,
    this.jenis,
  });

  String? idJenis;
  String? jenis;

  factory JenisPekerjaan.fromJson(Map<String, dynamic> json) => JenisPekerjaan(
        idJenis: json["id_jenis"],
        jenis: json["jenis"],
      );

  Map<String, dynamic> toJson() => {
        "id_jenis": idJenis,
        "jenis": jenis,
      };
}
