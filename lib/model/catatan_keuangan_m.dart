class CatatanKModel {
  bool? status;
  List<CatatanK>? data;

  CatatanKModel({this.status, this.data});

  CatatanKModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <CatatanK>[];
      json['data'].forEach((v) {
        data!.add(CatatanK.fromJson(v));
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

class CatatanK {
  String? id;
  String? tgl;
  String? jenis;
  String? jumlah;
  String? keterangan;

  CatatanK({this.id, this.tgl, this.jenis, this.jumlah, this.keterangan});

  CatatanK.fromJson(Map<String, dynamic> json) {
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
