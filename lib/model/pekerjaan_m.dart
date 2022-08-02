// To parse this JSON data, do
//
//     final pekerjaanModel = pekerjaanModelFromJson(jsonString);

import 'dart:convert';

PekerjaanModel pekerjaanModelFromJson(String str) =>
    PekerjaanModel.fromJson(json.decode(str));

String pekerjaanModelToJson(PekerjaanModel data) => json.encode(data.toJson());

class PekerjaanModel {
  PekerjaanModel({
    this.status,
    this.data,
  });

  bool? status;
  List<PekerjaanM>? data;

  factory PekerjaanModel.fromJson(Map<String, dynamic> json) => PekerjaanModel(
        status: json["status"],
        data: List<PekerjaanM>.from(
            json["data"].map((x) => PekerjaanM.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PekerjaanM {
  PekerjaanM({
    this.idPekerjaan,
    this.tglMasuk,
    this.nama,
    this.noTelp,
    this.jenis,
    this.keterangan,
    this.harga,
    this.status,
    this.idJenis,
  });

  String? idPekerjaan;
  DateTime? tglMasuk;
  String? nama;
  String? noTelp;
  String? jenis;
  String? keterangan;
  String? harga;
  String? status;
  String? idJenis;

  factory PekerjaanM.fromJson(Map<String, dynamic> json) => PekerjaanM(
        idPekerjaan: json["id_pekerjaan"],
        tglMasuk: DateTime.parse(json["tgl_masuk"]),
        nama: json["nama"],
        noTelp: json["no_telp"],
        jenis: json["jenis"],
        keterangan: json["keterangan"],
        harga: json["harga"],
        status: json["status"],
        idJenis: json['idJenis'],
      );

  Map<String, dynamic> toJson() => {
        "id_pekerjaan": idPekerjaan,
        "tgl_masuk": tglMasuk!.toIso8601String(),
        "nama": nama,
        "no_telp": noTelp,
        "jenis": jenis,
        "keterangan": keterangan,
        "harga": harga,
        "status": status,
        "idJenis": idJenis,
      };
}
