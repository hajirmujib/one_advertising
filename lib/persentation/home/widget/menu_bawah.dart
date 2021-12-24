import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_advertising/config/color.dart';
import 'package:one_advertising/core_widgets/grid_menu.dart';
import 'package:one_advertising/routes/app_routes.dart';
import 'package:sizer/sizer.dart';

class MenuBawah extends StatelessWidget {
  const MenuBawah({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 25, 15, 20),
        height: 40.h,
        width: 100.w,
        decoration: BoxDecoration(
            color: ColorApp.canvasColor,
            borderRadius: BorderRadius.circular(25)),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
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
              onTap: () {
                Get.toNamed(Routes.listPekerjaan);
              },
              child: const GridMenu(
                title: "Daftar Pekerjaan",
                ikon: CupertinoIcons.doc_chart_fill,
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
              onTap: () => Get.offAndToNamed(Routes.loginView),
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
