import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:one_advertising/model/user_model.dart';
import 'package:one_advertising/persentation/add_pekerjaan/widget/input_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import '../persentation/index.dart' hide MultipartFile;
import 'package:one_advertising/services/services.dart';

class UserController extends GetxController {
//?list jenis pekerjaan
  final listUser = <UserM>[].obs;

  // ?view state reactive value
  final viewState = ViewState.initial.obs;
  //? view state history
  final historyViewState = <ViewState>[];
//?field data user
  final nama = TextEditingController().obs;
  final email = TextEditingController().obs;
  final level = "".obs;
  final passwod = TextEditingController().obs;
  final idTemp = "".obs;
  final picker = ImagePicker();

  File fileController = File('');

  final filePath = ''.obs;
  final detailAkun = UserM().obs;
  final profile = UserM().obs;

  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final formatted = formatter.format(now);

  // final bytes = await File(path).readAsBytes();

  Future getImage(bool isFromGallery) async {
    final pickedFile = await picker.pickImage(
        source: isFromGallery ? ImageSource.gallery : ImageSource.camera);
    if (pickedFile != null) {
      fileController = File(pickedFile.path);
      filePath.value = pickedFile.path;
    } else {
      print('No image selected.');
    }
  }

  //?get data user
  Future<void> getUser() async {
    print("GET AKUN");

    _setState(ViewState.busy);
    try {
      var dataBaru = await RestClient().request("User", Method.get, {});
      print(dataBaru);
      var responseDataBaru = UserModel.fromJson(dataBaru);

      if (dataBaru['status'] == true) {
        listUser.clear();
        listUser.addAll(responseDataBaru.data!);
      } else {
        print("LIST AKUN KOSONG");
        listUser.clear();
        listUser.addAll([]);
      }
    } catch (e) {
      _setState(ViewState.error);
    } finally {
      _setState(ViewState.data);
    }
  }
//?get akun by id

  void getDetailUser() async {
    _setState(ViewState.busy);

    try {
      var dataBaru = await RestClient()
          .request("User", Method.get, {"id_akun": idTemp.value});
      var responseDataBaru = UserM.fromJson(dataBaru['data']);
      detailAkun.value = responseDataBaru;
      // print(dataBaru['nama'].toString());
      nama.value.text = detailAkun.value.nama!;
      email.value.text = detailAkun.value.email!;
      _setState(ViewState.data);
    } catch (e) {
      print("ERROR : " + e.toString());
      _setState(ViewState.error);
    }

    _setState(ViewState.data);
  }

  //
  Future<void> getProfile() async {
    _setState(ViewState.busy);

    final pref = await SharedPreferences.getInstance();
    final id = pref.getString("token");

    try {
      var dataBaru =
          await RestClient().request("User", Method.get, {"id_akun": id});
      var responseDataBaru = UserM.fromJson(dataBaru['data']);
      profile.value = responseDataBaru;
      // print(dataBaru['nama'].toString());
      _setState(ViewState.data);
    } catch (e) {
      print("ERROR : " + e.toString());
      _setState(ViewState.error);
    }

    _setState(ViewState.data);
  }

  //? add jenis pekerjaan
  Future<void> addUser() async {
    _setState(ViewState.busy);
    try {
      var dataBaru = await RestClient().request("User", Method.post, {
        "nama": nama.value.text,
        "email": email.value.text,
        "level": "Admin",
        "password": passwod.value.text
      });

      if (dataBaru['status'] == true) {
        nama.value.clear();
        email.value.clear();
        passwod.value.clear();
        level.value = "";
        listUser.clear();

        getUser();

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
  Future<void> editUser() async {
    _setState(ViewState.busy);
    // dynamic dataBaru;
    try {
      final pref = await SharedPreferences.getInstance();
      final id = pref.getString("token");
      var dataBaru = await RestClient().request("User/edit", Method.post, {
        "nama": nama.value.text == "" ? detailAkun.value.nama : nama.value.text,
        "email":
            email.value.text == "" ? detailAkun.value.email : email.value.text,
        "level": "admin",
        "password": passwod.value.text,
        "id_akun": idTemp.value == "" ? id : idTemp.value,
        "foto": fileController.path != ""
            ? await MultipartFile.fromFile(
                fileController.path,
                filename: "profile.jpg",
              )
            : "",
      });

      if (dataBaru['status'] == true) {
        // nama.value.clear();
        // email.value.clear();
        // passwod.value.clear();
        // level.value = "";

        getDetailUser();
        getProfile();

        listUser.clear();
        // Get.back();
        getUser();
        update();
        filePath.value = "";
        succesSnacbar();
      } else {
        failedSnackbar();
      }
    } catch (e) {
      print("error : " + e.toString());
      _setState(ViewState.error);
    } finally {
      getDetailUser();

      _setState(ViewState.data);
    }
  }

  //?delete data jenis pekerjaan
  Future<void> deleteUser() async {
    _setState(ViewState.busy);
    try {
      var dataBaru = await RestClient()
          .request("User/delete", Method.get, {"id_akun": idTemp.value});

      if (dataBaru['status'] == true) {
        Get.back();
        succesSnacbar();
        listUser.clear();
        getUser();
      } else {
        failedSnackbar();
      }
    } catch (e) {
      _setState(ViewState.error);
    } finally {
      _setState(ViewState.data);
    }
  }

  //?view/widget edit jenis pekerjaan
  edit({String? data}) {
    TextEditingController? txtC;
    if (data == "nama") {
      txtC = nama.value;
    } else if (data == "email") {
      txtC = email.value;
    } else if (data == "password") {
      txtC = passwod.value;
    }
    return Get.defaultDialog(
        title: "Edit " + data!,
        content: textInput(controller: txtC),
        textConfirm: "Simpan",
        textCancel: "Kembali",
        confirmTextColor: Colors.white,
        onConfirm: () {
          editUser();
        });
  }

  @override
  void onInit() {
    getUser();
    // getDetailUser();
    getProfile();
    super.onInit();
  }

  //? set viewstate
  void _setState(ViewState state) {
    viewState.value = state;
    historyViewState.add(state);
  }
}
