// To parse this JSON data, do
//
//     final pekerjaanModel = pekerjaanModelFromJson(jsonString);

import 'dart:convert';

List<PekerjaanModel> pekerjaanModelFromJson(String str) =>
    List<PekerjaanModel>.from(
        json.decode(str).map((x) => PekerjaanModel.fromJson(x)));

String pekerjaanModelToJson(List<PekerjaanModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PekerjaanModel {
  PekerjaanModel({
    this.id,
    this.tanggal,
    this.nama,
    this.noTelp,
    this.jenis,
    this.harga,
    this.status,
    this.keterangan,
  });

  String? id;
  String? tanggal;
  String? nama;
  String? noTelp;
  String? jenis;
  int? harga;
  String? status;
  String? keterangan;

  factory PekerjaanModel.fromJson(Map<String, dynamic> json) => PekerjaanModel(
        id: json["id"],
        tanggal: json["tanggal"],
        nama: json["nama"],
        noTelp: json["no_telp"],
        jenis: json["jenis"],
        harga: json["harga"],
        status: json["status"],
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tanggal": tanggal,
        "nama": nama,
        "no_telp": noTelp,
        "jenis": jenis,
        "harga": harga,
        "status": status,
        "keterangan": keterangan,
      };
}
