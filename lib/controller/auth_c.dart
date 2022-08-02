import 'package:email_validator/email_validator.dart';
import 'package:one_advertising/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../persentation/index.dart';
import 'global_c.dart';

class AuthC extends GlobalController {
  //?controller field login
  final email = TextEditingController().obs;
  final pass = TextEditingController().obs;

  //?get token di pref
  Future<String> getIdUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("token").toString();
  }

  //?show pass di textfield
  final isShow = true.obs;
  void changeIsShow() => isShow.value ? isShow(false) : isShow(true);
//?login validator
//?jika valid jalankan func untuk get ke API
  void login() {
    //validasi field login
    if (email.value.text == "" || pass.value.text == "") {
      Get.snackbar("Validator", "Harap Lengkapi Semua Field");
    } else if (!EmailValidator.validate(email.value.text)) {
      Get.snackbar("Validator", "Email Tidak Valid");
    } else {
      loginFunc();
    }
  }

  //? add user ke API
  //?jika ada kirim token ke func refresh untuk disimpan ke shared pref
  //?dan juga set status login menjadi 1
  //?jika sudah arahkan ke halaman bottombar/ home page
  Future<void> loginFunc() async {
    setState(ViewState.busy);
    try {
      var dataBaru = await RestClient().request("Auth/Login", Method.post, {
        "email": email.value.text,
        "password": pass.value.text,
      });
      print("STATUS : " + dataBaru['status'].toString());
      if (dataBaru['status'] == true) {
        final tokenRes = dataBaru['data'][0]['id_akun'];

        //?clear textfield email & pass
        email.value.clear();
        pass.value.clear();
        //?cek token & save to pref
        refresh(token: tokenRes.toString());

        Get.snackbar("Validator", "Succes");
        Get.toNamed(Routes.homeAdmin);
      } else {
        Get.snackbar("Validator", "Failed, Silahkan Coba Lagi");
      }
    } catch (e) {
      print(e.toString());
      setState(ViewState.error);
    } finally {
      print("STATUS : data");
      setState(ViewState.data);
    }
  }

//?refresh pref token dan status login
  @override
  Future<bool> refresh({String? token}) async {
    final pref = await SharedPreferences.getInstance();
    // String? token = pref.getString("status");
    bool succes = false;

    if (token == "") {
      return succes = false;
    } else if (token == null) {
      return succes = false;
    }

    if (token != "") {
      //?set pref token
      pref.setString("token", token.toString());
      //?set pref status login
      pref.setString("status", "1");
      //?set status token
      succes = true;
    }

    return succes;
  }

//?func check sudah login/belum
//?cek jika pref status 1 arahkan ke halaman home/bottombar
//?jika 0 arahkan ke landing page untuk login/register account
  Future<dynamic> goto() async {
    final pref = await SharedPreferences.getInstance();
    final value = pref.getString("status");
    final token = pref.getString("token");

    if (value == "1" && token != "") {
      try {
        bool refresh = await this.refresh(token: token.toString());
        if (refresh) {
          return Get.toNamed(Routes.homeAdmin);
        }
      } catch (e) {
        isShow(true);
        return Get.toNamed(Routes.loginView);
      }
    }

    return Get.toNamed(Routes.loginView);
  }

  //?logout,reset token dan status login
  Future<bool> logOut() async {
    setState(ViewState.busy);
    var succes = false;
    try {
      final pref = await SharedPreferences.getInstance();
      pref.remove("token");
      pref.remove("status");

      pref.setString("status", "");
      pref.setString("token", "");
    } catch (e) {
      setState(ViewState.error);
    } finally {
      succes = true;
      setState(ViewState.data);
    }

    return succes;
  }
}
