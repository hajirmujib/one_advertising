import 'package:get/route_manager.dart';
import 'package:one_advertising/persentation/catatan_keuangan/catatan_keuangan.dart';
import 'package:one_advertising/persentation/akun/akun_page.dart';
import 'package:one_advertising/persentation/catatan_keuangan/detail_keuangan.dart';
import 'package:one_advertising/persentation/list_pekerjaan/daftar_pekerjaan.dart';
import 'package:one_advertising/persentation/list_pekerjaan/pekerjaan_binding.dart';
import 'package:one_advertising/persentation/detail_pekerjaan/detail_pekerjaan.dart';
import 'package:one_advertising/persentation/home/home.dart';
import 'package:one_advertising/persentation/pekerjaan/pekerjaan_baru.dart';
import 'package:one_advertising/persentation/detail_akun/detail_akun.dart';
import 'package:one_advertising/persentation/login/login_view.dart';

import 'app_routes.dart';

class AppPages {
  static const initialPage = Routes.loginView;

  static final routes = [
    GetPage(name: Routes.homeAdmin, page: () => const HomeAdmin()),
    GetPage(name: Routes.listAkun, page: () => const DaftarAkun()),
    GetPage(name: Routes.listCatatanUang, page: () => const CatatanKeuangan()),
    GetPage(
        name: Routes.listPekerjaan,
        page: () => const DaftarPekerjaan(),
        binding: PekerjaanBinding()),
    GetPage(name: Routes.addPekerjaan, page: () => const PekerjaanBaru()),
    GetPage(name: Routes.detailKeuangan, page: () => DetailKeuangan()),
    GetPage(name: Routes.detailPekerjaan, page: () => const DetailPekerjaan()),
    GetPage(name: Routes.detailAkun, page: () => const DetailAkun()),
    GetPage(name: Routes.loginView, page: () => const LoginView()),
    // GetPage(name: Routes.editAkun, page: ()=>const EditAk)
  ];
}
