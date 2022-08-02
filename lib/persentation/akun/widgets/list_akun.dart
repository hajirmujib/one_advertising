import 'package:one_advertising/controller/user_c.dart';
import 'package:one_advertising/model/user_model.dart';

import '../../index.dart';
import 'card_akun.dart';

class ListAkun extends GetView<UserController> {
  const ListAkun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(() {
        if (controller.listUser.isEmpty) {
          return UnDraw(
            padding: EdgeInsets.all(20.w),
            illustration: UnDrawIllustration.empty,
            fit: BoxFit.contain,
            color: Colors.blue,
          );
        } else {
          return RefreshIndicator(
            onRefresh: () {
              return controller.getUser();
            },
            child: Obx(
              () => ListView.builder(
                itemCount: controller.listUser.length,
                itemBuilder: (context, i) {
                  UserM x = controller.listUser[i];
                  return PopupMenuButton(
                    itemBuilder: (context) => <PopupMenuEntry>[
                      PopupMenuItem(
                        child: const Text("Hapus"),
                        onTap: () {
                          controller.idTemp.value = x.idAkun.toString();
                          Future.delayed(
                            const Duration(seconds: 0),
                            () => deleteAlert(
                                confirm: controller.deleteUser,
                                content: x.nama),
                          );
                        },
                      ),
                    ],
                    tooltip: "",
                    child: InkWell(
                      onTap: () async {
                        // controller.level.value = x.level!;
                        // controller.nama.value.text = x.nama!;
                        // controller.email.value.text = x.email.toString();
                        controller.idTemp.value = x.idAkun.toString();
                        controller.getDetailUser();
                        Get.toNamed(Routes.detailAkun);
                      }, //?pindah ke halaman detail akun
                      child: cardAkun(
                          image: x.foto.toString(),
                          nama: x.nama,
                          level: x.level),
                    ),
                  );
                },
              ),
            ),
          );
        }
      });
}
