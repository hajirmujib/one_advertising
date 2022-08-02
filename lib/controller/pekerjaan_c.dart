import 'package:one_advertising/controller/catatan_keuangan_c.dart';
import 'package:one_advertising/model/catatan_keuangan_m.dart';
import 'package:one_advertising/model/pekerjaan_m.dart';
import 'package:one_advertising/persentation/index.dart';
import 'package:one_advertising/services/services.dart';

class PekerjaanC extends GetxController {
  final catatanK = Get.put(CatatanKeuanganC());
  var isLoading = false.obs;
  //?list pekerjaan
  final listPerkerjaanBaru = <PekerjaanM>[].obs;
  final listPerkerjaanProses = <PekerjaanM>[].obs;
  final listPerkerjaanSelesai = <PekerjaanM>[].obs;

  // ?view state reactive value
  final viewState = ViewState.initial.obs;
  //? view state history
  final historyViewState = <ViewState>[];
  //?temporary id pekerjaan
  final idTemp = "".obs;
  //?field data pekerjaan
  //?untuk menampun data sebelum di kirimkan ke api
  final keterangan = TextEditingController().obs;
  final namaPelanggan = TextEditingController().obs;
  final notepPelanggan = TextEditingController().obs;
  final hargaPekerjaan = TextEditingController(text: "0").obs;
  final jenisPekerjaan = "".obs;
  final statusPekerjaan = "".obs;
  //?list status pekerjaan
  final listStatusPekerjaan = ["baru", "proses", "selesai"];
  final detailPekerjaan = PekerjaanM().obs;

  final pengeluaran = "0".obs;
  final pemasukan = "0".obs;

  //?get detail pekerjaan
  Future<PekerjaanM> getDetailPekerjaan() async {
    isLoading(true);
    PekerjaanM res;

    try {
      var dataBaru = await RestClient()
          .request("Service", Method.get, {"id_pekerjaan": idTemp});

      var responseDataBaru = PekerjaanModel.fromJson(dataBaru);
      detailPekerjaan.value = responseDataBaru.data![0];
      keterangan.value.text = detailPekerjaan.value.keterangan.toString();
      namaPelanggan.value.text = detailPekerjaan.value.nama.toString();
      notepPelanggan.value.text = detailPekerjaan.value.noTelp.toString();
      statusPekerjaan.value = detailPekerjaan.value.status.toString();
      jenisPekerjaan.value = detailPekerjaan.value.idJenis.toString();
      hargaPekerjaan.value.text = detailPekerjaan.value.harga.toString();
      res = responseDataBaru.data![0];
    } finally {
      isLoading(false);
    }

    return res;
  }

  //?get cashflow
  getCashflow() async {
    isLoading(true);

    try {
      var dataBaru = await RestClient().request("Cashflow", Method.get, {});
      var res = dataBaru['data'];
      pemasukan.value = res['pemasukan'].toString();
      pengeluaran.value = res['pengeluaran'].toString();
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }

  //?get data pekerjaan
  Future<void> getPekerjaanBaru() async {
    _setState(ViewState.busy);
    try {
      var dataBaru =
          await RestClient().request("Service", Method.get, {"status": "baru"});

      var responseDataBaru = PekerjaanModel.fromJson(dataBaru);

      if (responseDataBaru.status == true) {
        listPerkerjaanBaru.addAll(responseDataBaru.data!);
      } else {
        listPerkerjaanBaru.addAll([]);
      }
    } catch (e) {
      _setState(ViewState.error);
    } finally {
      _setState(ViewState.data);
    }
  }

  //?delete data pekerjaan
  Future<void> deletePekerjaan() async {
    _setState(ViewState.busy);
    try {
      var dataBaru = await RestClient().request(
          "Service/delete", Method.get, {"id_pekerjaan": idTemp.value});

      if (dataBaru['status'] == true) {
        Get.back();
        Get.back();
        succesSnacbar();
        listPerkerjaanBaru.clear();
        listPerkerjaanProses.clear();
        listPerkerjaanSelesai.clear();
        getPekerjaanBaru();
        getPekerjaanProses();
        getPekerjaanSelesai();
        getCashflow();
      } else {
        failedSnackbar();
      }
    } catch (e) {
      _setState(ViewState.error);
    } finally {
      _setState(ViewState.data);
    }
  }

  Future<void> getPekerjaanProses() async {
    _setState(ViewState.busy);
    try {
      var dataProses = await RestClient()
          .request("Service", Method.get, {"status": "proses"});
      var responseDataProses = PekerjaanModel.fromJson(dataProses);

      if (responseDataProses.status == true) {
        listPerkerjaanProses.addAll(responseDataProses.data!);
      } else {
        listPerkerjaanProses.addAll([]);
      }
    } catch (e) {
      _setState(ViewState.error);
    } finally {
      _setState(ViewState.data);
    }
  }

  Future<void> getPekerjaanSelesai() async {
    _setState(ViewState.busy);
    try {
      var dataSelesai = await RestClient()
          .request("Service", Method.get, {"status": "selesai"});
      var responseDataSelesai = PekerjaanModel.fromJson(dataSelesai);

      if (responseDataSelesai.status == true) {
        listPerkerjaanSelesai.addAll(responseDataSelesai.data!);
      } else {
        listPerkerjaanSelesai.addAll([]);
      }
    } catch (e) {
      _setState(ViewState.error);
    } finally {
      _setState(ViewState.data);
    }
  }

  //?add new data pekerjaan
  Future<void> addPekerjaan() async {
    _setState(ViewState.busy);
    if (namaPelanggan.value.text != "" &&
        keterangan.value.text != "" &&
        notepPelanggan.value.text != "" &&
        jenisPekerjaan.value != "") {
      try {
        var dataBaru = await RestClient().request("Service", Method.post, {
          "nama": namaPelanggan.value.text,
          "keterangan": keterangan.value.text,
          "no_telp": notepPelanggan.value.text,
          "jenis": jenisPekerjaan.value,
        });

        if (dataBaru['status'] == true) {
          succesSnacbar();
          namaPelanggan.value.clear();
          notepPelanggan.value.clear();
          keterangan.value.clear();
          jenisPekerjaan.value = "";
          listPerkerjaanBaru.clear();
          getPekerjaanBaru();
        } else {
          failedSnackbar();
        }
      } catch (e) {
        _setState(ViewState.error);
      } finally {
        _setState(ViewState.data);
        // Get.back();
      }
    } else {
      failedSnackbar();
      _setState(ViewState.data);
    }
  }

  //? edit jenis pekerjaan
  Future<void> editPekerjaan() async {
    _setState(ViewState.busy);
    try {
      var dataBaru = await RestClient().request("Service/edit", Method.post, {
        "nama": namaPelanggan.value.text,
        "keterangan": keterangan.value.text,
        "no_telp": notepPelanggan.value.text,
        "jenis": jenisPekerjaan.value,
        "harga": hargaPekerjaan.value.text,
        "status": statusPekerjaan.value,
        "id_pekerjaan": idTemp.value,
      });
      if (statusPekerjaan.value == "selesai") {
        catatanK.statusJenis.value = "Pemasukan";
        catatanK.keterangan.value.text = keterangan.value.text;
        catatanK.jumlah.value.text = hargaPekerjaan.value.text;
        catatanK.addCatatanK();
        getCashflow();
      }

      if (dataBaru['status'] == true) {
        succesSnacbar();
        namaPelanggan.value.clear();
        notepPelanggan.value.clear();
        keterangan.value.clear();
        jenisPekerjaan.value = "";
        listPerkerjaanBaru.clear();
        listPerkerjaanProses.clear();
        listPerkerjaanSelesai.clear();
        getPekerjaanBaru();
        getPekerjaanProses();
        getPekerjaanSelesai();
        getDetailPekerjaan();
      } else {
        failedSnackbar();
      }
    } catch (e) {
      _setState(ViewState.error);
    } finally {
      _setState(ViewState.data);
    }
  }

  //? set viewstate
  void _setState(ViewState state) {
    viewState.value = state;
    historyViewState.add(state);
  }

//?init state
  @override
  void onInit() {
    //? get pekerjaan on init
    getPekerjaanBaru();
    getPekerjaanProses();
    getPekerjaanSelesai();
    getCashflow();
    super.onInit();
  }
}
