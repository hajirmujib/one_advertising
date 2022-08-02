class LaporanModel {
  bool? status;
  List<LaporanM>? data;

  LaporanModel({this.status, this.data});

  LaporanModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <LaporanM>[];
      json['data'].forEach((v) {
        data!.add(LaporanM.fromJson(v));
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

class LaporanM {
  String? id;
  String? tgl;
  String? jenis;
  String? jumlah;
  String? keterangan;

  LaporanM({this.id, this.tgl, this.jenis, this.jumlah, this.keterangan});

  LaporanM.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tgl = json['tgl'];
    jenis = json['jenis'];
    jumlah = json['jumlah'];
    keterangan = json['keterangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tgl'] = tgl;
    data['jenis'] = jenis;
    data['jumlah'] = jumlah;
    data['keterangan'] = keterangan;
    return data;
  }
}
