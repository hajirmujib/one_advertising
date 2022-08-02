import 'package:one_advertising/controller/jenis_pekerjaan_c.dart';
import 'package:one_advertising/model/jenis_pekerjaan_m.dart';

import '../../index.dart';

class WidgetListJenisPekerjaan extends GetView<JenisPekerjaanC> {
  const WidgetListJenisPekerjaan({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Obx(() {
        if (controller.listJenisPerkerjaan.isEmpty) {
          return UnDraw(
            padding: EdgeInsets.all(20.w),
            illustration: UnDrawIllustration.empty,
            fit: BoxFit.contain,
            color: Colors.blue,
          );
        } else {
          return RefreshIndicator(
            onRefresh: () {
              return controller.getJenisPekerjaan();
            },
            child: Obx(
              () => ListView.builder(
                itemCount: controller.listJenisPerkerjaan.length,
                itemBuilder: (context, i) {
                  JenisPekerjaan x = controller.listJenisPerkerjaan[i];
                  return PopupMenuButton(
                    itemBuilder: (context) => <PopupMenuEntry>[
                      PopupMenuItem(
                        child: const Text("Edit"),
                        onTap: () {
                          controller.idTemp.value = x.idJenis.toString();
                          controller.jenisPekerjaan.value.text =
                              x.jenis.toString();
                          controller.editJenis();
                          Future.delayed(
                            const Duration(seconds: 0),
                            () => controller.editJenis(),
                          );
                          Get.back();
                        },
                      ),
                      PopupMenuItem(
                        child: const Text("Hapus"),
                        onTap: () {
                          controller.idTemp.value = x.idJenis.toString();
                          Future.delayed(
                            const Duration(seconds: 0),
                            () => deleteAlert(
                                confirm: controller.deleteJenisPekerjaan,
                                content: x.jenis),
                          );
                        },
                      ),
                    ],
                    tooltip: "",
                    child: Container(
                      width: 100.w,
                      // height: 16.h,
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 2.h),
                      margin: EdgeInsets.only(bottom: 1.h),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(x.jenis.toString(),
                            style: TextStyle(
                                color: Colors.blue[900]!,
                                fontSize: 15.sp,
                                fontFamily: "Poppin Semi Bold")),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
      });
}
