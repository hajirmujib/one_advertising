import 'package:one_advertising/model/jenis_pekerjaan_m.dart';
import 'package:one_advertising/persentation/add_pekerjaan/widget/input_widget.dart';
import 'package:one_advertising/persentation/index.dart';
import 'package:one_advertising/services/services.dart';

class JenisPekerjaanC extends GetxController {
  //?list jenis pekerjaan
  final listJenisPerkerjaan = <JenisPekerjaan>[].obs;

  // ?view state reactive value
  final viewState = ViewState.initial.obs;
  //? view state history
  final historyViewState = <ViewState>[];
//?field jenis pekerjaan
  final jenisPekerjaan = TextEditingController().obs;
  final idTemp = "".obs;

  //?get data pekerjaan
  Future<void> getJenisPekerjaan() async {
    _setState(ViewState.busy);
    try {
      var dataBaru =
          await RestClient().request("Jenis_pekerjaan", Method.get, {});
      var responseDataBaru = JenispekerjaanM.fromJson(dataBaru);

      if (responseDataBaru.status == true) {
        listJenisPerkerjaan.clear();
        listJenisPerkerjaan.addAll(responseDataBaru.data!);
      } else {
        listJenisPerkerjaan.addAll([]);
      }
    } catch (e) {
      _setState(ViewState.error);
    } finally {
      _setState(ViewState.data);
    }
  }

  //? add jenis pekerjaan
  Future<void> addJenisPekerjaan() async {
    _setState(ViewState.busy);
    try {
      var dataBaru = await RestClient().request(
          "Jenis_pekerjaan", Method.post, {"jenis": jenisPekerjaan.value.text});

      if (dataBaru['status'] == true) {
        jenisPekerjaan.value.clear();

        getJenisPekerjaan();

        succesSnacbar();
      } else {
        failedSnackbar();
      }
    } catch (e) {
      _setState(ViewState.error);
    } finally {
      _setState(ViewState.data);
    }
  }

  //? edit jenis pekerjaan
  Future<void> editJenisPekerjaan() async {
    _setState(ViewState.busy);
    try {
      var dataBaru = await RestClient().request(
          "Jenis_pekerjaan/edit",
          Method.post,
          {"jenis": jenisPekerjaan.value.text, "id_jenis": idTemp.value});

      if (dataBaru['status'] == true) {
        jenisPekerjaan.value.clear();
        listJenisPerkerjaan.clear();
        listJenisPerkerjaan.refresh();
        Get.back();
        getJenisPekerjaan();
        succesSnacbar();
      } else {
        failedSnackbar();
      }
    } catch (e) {
      _setState(ViewState.error);
    } finally {
      _setState(ViewState.data);
    }
  }

  //?delete data jenis pekerjaan
  Future<void> deleteJenisPekerjaan() async {
    _setState(ViewState.busy);
    try {
      var dataBaru = await RestClient().request(
          "Jenis_pekerjaan/delete", Method.get, {"id_jenis": idTemp.value});

      if (dataBaru['status'] == true) {
        Get.back();
        succesSnacbar();
        listJenisPerkerjaan.clear();
        getJenisPekerjaan();
      } else {
        failedSnackbar();
      }
    } catch (e) {
      _setState(ViewState.error);
    } finally {
      _setState(ViewState.data);
    }
  }

  //?view/widget add jenis pekerjaan
  addJenis() {
    return Get.defaultDialog(
        title: "Tambah Jenis Pekerjaan",
        content: Obx(() => textInput(
            controller: jenisPekerjaan.value,
            textCapitalization: TextCapitalization.words)),
        textConfirm: "Simpan",
        textCancel: "Batal",
        confirmTextColor: Colors.white,
        onConfirm: () {
          addJenisPekerjaan();
        });
  }

  //?view/widget edit jenis pekerjaan
  editJenis() {
    return Get.defaultDialog(
        title: "Edit Jenis Pekerjaan",
        content: Obx(() => textInput(controller: jenisPekerjaan.value)),
        textConfirm: "Simpan",
        textCancel: "Batal",
        confirmTextColor: Colors.white,
        onConfirm: () {
          editJenisPekerjaan();
        });
  }

  @override
  void onInit() {
    getJenisPekerjaan();
    super.onInit();
  }

  //? set viewstate
  void _setState(ViewState state) {
    viewState.value = state;
    historyViewState.add(state);
  }
}
