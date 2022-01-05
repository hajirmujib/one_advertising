import 'package:one_advertising/model/pekerjaan_m.dart';
import 'package:one_advertising/persentation/index.dart';
import 'package:one_advertising/services/services.dart';

class PekerjaanC extends GetxController {
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
  final jenisPekerjaan = "".obs;

  //?get detail pekerjaan
  Future<PekerjaanM> getDetailPekerjaan() async {
    isLoading(true);
    PekerjaanM res;
    try {
      var dataBaru = await RestClient()
          .request("Service", Method.get, {"id_pekerjaan": idTemp});

      var responseDataBaru = PekerjaanModel.fromJson(dataBaru);
      res = responseDataBaru.data![0];
    } finally {
      isLoading(false);
    }

    return res;
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
    try {
      var dataBaru = await RestClient().request("Service", Method.post, {
        "nama": namaPelanggan.value.text,
        "keterangan": keterangan.value.text,
        "no_telp": notepPelanggan.value.text,
        "jenis": jenisPekerjaan.value,
      });

      if (dataBaru['status'] == true) {
        Get.snackbar("Status", "Succes",
            maxWidth: 100.w,
            borderColor: Colors.blue[400],
            borderWidth: 1.0,
            backgroundColor: Colors.white,
            borderRadius: 5);
      } else {
        Get.snackbar("Status", "Failed",
            maxWidth: 100.w,
            borderColor: Colors.red[400],
            borderWidth: 1.0,
            backgroundColor: Colors.white,
            borderRadius: 5);
      }
    } catch (e) {
      _setState(ViewState.error);
    } finally {
      _setState(ViewState.data);
      // Get.back();
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
    super.onInit();
  }
}
