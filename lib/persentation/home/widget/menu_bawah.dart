import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_advertising/config/color.dart';
import 'package:one_advertising/controller/auth_c.dart';
import 'package:one_advertising/controller/pekerjaan_c.dart';
import 'package:one_advertising/core_widgets/grid_menu.dart';
import 'package:one_advertising/routes/app_routes.dart';
import 'package:sizer/sizer.dart';

class MenuBawah extends GetView<PekerjaanC> {
  const MenuBawah({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authC = Get.put(AuthC());

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 25, 15, 20),
        height: 70.h,
        width: 100.w,
        constraints: BoxConstraints(minHeight: 35.h, maxHeight: 40.h),
        decoration: BoxDecoration(
            color: ColorApp.canvasColor,
            borderRadius: BorderRadius.circular(25)),
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 0.9,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            InkWell(
              onTap: () {
                Get.toNamed(Routes.addPekerjaan);
              },
              child: const GridMenu(
                title: "Pekerjaan Baru",
                ikon: CupertinoIcons.add_circled_solid,
              ),
            ),
            InkWell(
              onTap: () async {
                Get.toNamed(Routes.listPekerjaan);
              },
              child: const GridMenu(
                title: "Daftar Pekerjaan",
                ikon: CupertinoIcons.square_list_fill,
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.listJenisPekerjaan);
              },
              child: const GridMenu(
                title: "Jenis Pekerjaan",
                ikon: CupertinoIcons.square_list,
              ),
            ),
            InkWell(
              onTap: () => Get.toNamed(Routes.listAkun),
              child: const GridMenu(
                title: "Akun",
                ikon: CupertinoIcons.person_circle_fill,
              ),
            ),
            InkWell(
              onTap: () => Get.toNamed(Routes.laporanView),
              child: const GridMenu(
                  title: "Laporan", ikon: CupertinoIcons.book_circle_fill),
            ),
            InkWell(
              onTap: () async {
                await authC.logOut().then((value) {
                  if (value == true) {
                    Get.snackbar("Status", "Berhasil Log Out");
                    // Get.offAndToNamed(Routes.loginView);
                    Get.offAllNamed(Routes.loginView);
                  } else {
                    Get.snackbar("Status", "Gagal Log Out");
                  }
                });
              },
              child: const GridMenu(
                title: "Log Out",
                ikon: Icons.exit_to_app,
              ),
            )
          ],
        ),
      ),
    );
  }
}
