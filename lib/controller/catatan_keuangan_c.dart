import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:one_advertising/config/alert.dart';
import 'package:one_advertising/config/enum.dart';
import 'package:one_advertising/model/catatan_keuangan_m.dart';
import 'package:one_advertising/services/services.dart';

class CatatanKeuanganC extends GetxController {
  //?status default jenis catatan keuangan
  var statusJenis = "Pengeluaran".obs;
  var jumlah = TextEditingController().obs;
  var keterangan = TextEditingController().obs;

  // ?view state reactive value
  final viewState = ViewState.initial.obs;
  //? view state history
  final historyViewState = <ViewState>[];
  //?temporary id keuangan
  final idTemp = "".obs;
  final listCataan = <CatatanK>[].obs;

  late Rx<CatatanK> detailCatatan = CatatanK.fromJson(
      {"id": "0", "tgl": "", "jenis": "", "jumlah": "", "keterangan": ""}).obs;

  // getJam(String? newTanggal) {
  //   final jiffy =
  //       Jiffy(newTanggal.toString(), "yyyy-MM-dd h:mm:ss").format("HH:mm");
  //   print(jiffy.toString());

  //   return jiffy;
  // }

  //?get data keuangan
  Future<List<CatatanK>> getCatatanKeuangan() async {
    _setState(ViewState.busy);

    try {
      var dataBaru = await RestClient().request("Keuangan", Method.get, {});

      var responseDataBaru = CatatanKModel.fromJson(dataBaru);

      if (responseDataBaru.status == true) {
        listCataan.clear();
        listCataan.addAll(responseDataBaru.data!);
      } else {
        listCataan.addAll([]);
      }
    } catch (e) {
      _setState(ViewState.error);
    } finally {
      _setState(ViewState.data);
    }

    return listCataan;
  }

  //?get detail keuangan
  Future<void> getDetailCatatanKeuangan() async {
    _setState(ViewState.busy);
    try {
      var dataBaru = await RestClient()
          .request("Keuangan", Method.get, {"id": idTemp.value});

      var responseDataBaru = CatatanKModel.fromJson(dataBaru);

      detailCatatan.value = responseDataBaru.data![0];
    } catch (e) {
      _setState(ViewState.error);
    } finally {
      _setState(ViewState.data);
    }
  }

  //?add new data pekerjaan
  Future<void> addCatatanK() async {
    _setState(ViewState.busy);
    try {
      var dataBaru = await RestClient().request("Keuangan", Method.post, {
        "jenis": statusJenis.value,
        "keterangan": keterangan.value.text,
        "jumlah": jumlah.value.text,
      });

      if (dataBaru['status'] == true) {
        succesSnacbar();
        statusJenis.value = "";
        jumlah.value.clear();
        keterangan.value.clear();
        getCatatanKeuangan();
        // getDetailCatatanKeuangan();
        // Get.back();
      } else {
        failedSnackbar();
      }
    } catch (e) {
      _setState(ViewState.error);
    } finally {
      _setState(ViewState.data);
      // Get.back();
    }
  }

  //?edit catatan
  Future<void> editCatatanK() async {
    _setState(ViewState.busy);
    try {
      var dataBaru = await RestClient().request("Keuangan/edit", Method.post, {
        "id": idTemp.value,
        "jenis": detailCatatan.value.jenis.toString(),
        "keterangan": keterangan.value.text,
        "jumlah": detailCatatan.value.jumlah.toString(),
      });

      if (dataBaru['status'] == true) {
        // getDetailCatatanKeuangan();
        keterangan.value.clear();
        Get.back();

        getCatatanKeuangan();
        getDetailCatatanKeuangan();
        succesSnacbar();
      } else {
        failedSnackbar();
      }
    } catch (e) {
      _setState(ViewState.error);
    } finally {
      getDetailCatatanKeuangan();

      _setState(ViewState.data);
      // Get.back();
    }
  }

  //?edit catatan
  Future<void> deleteCatatanK() async {
    _setState(ViewState.busy);
    try {
      var dataBaru = await RestClient().request("Keuangan/delete", Method.get, {
        "id": idTemp.value,
      });

      if (dataBaru['status'] == true) {
        getCatatanKeuangan();

        Get.back();
        succesSnacbar();
      } else {
        failedSnackbar();
      }
    } catch (e) {
      _setState(ViewState.error);
    } finally {
      _setState(ViewState.data);
      // Get.back();
    }
  }

  void editKeterangan() {
    Get.defaultDialog(
      title: "Edit Keterangan",
      content: TextFormField(
        controller: keterangan.value,
        decoration: InputDecoration(
            border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue[900]!),
          borderRadius: BorderRadius.circular(10),
        )),
      ),
      textCancel: "Kembali",
      textConfirm: "Edit",
      onCancel: () {
        // getDetailCatatanKeuangan();
        // Get.back();
      },
      onConfirm: () {
        editCatatanK();
      },
      confirmTextColor: Colors.white,
    );
  }

  //? set viewstate
  void _setState(ViewState state) {
    viewState.value = state;
    historyViewState.add(state);
  }

  @override
  void onInit() {
    getCatatanKeuangan();
    // detailCatatan = CatatanK.fromJson(
    //     {"id": "0", "tgl": "", "jenis": "", "jumlah": "", "keterangan": ""});
    super.onInit();
  }
}
