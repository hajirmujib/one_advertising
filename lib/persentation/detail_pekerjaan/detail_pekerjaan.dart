import 'package:flutter/cupertino.dart';
import 'package:one_advertising/controller/pekerjaan_c.dart';
import 'package:one_advertising/model/pekerjaan_m.dart';

import '../index.dart';
import 'widget/card_detail_pekerjaan.dart';

class DetailPekerjaan extends GetView<PekerjaanC> {
  const DetailPekerjaan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorApp.canvasColor,
        appBar: AppBar(
          title: const Text(
            "Detail Pekerjaan",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: "Poppin Semi Bold"),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  await controller
                      .getDetailPekerjaan()
                      .then((value) => {Get.toNamed(Routes.editPekerjaan)});
                },
                icon: const Icon(Icons.edit_outlined)),
            IconButton(
                onPressed: () {
                  deleteAlert(
                      confirm: controller.deletePekerjaan,
                      content: controller.idTemp.value);
                },
                icon: const Icon(CupertinoIcons.delete))
          ],
        ),
        body: FutureBuilder(
            future: controller.getDetailPekerjaan(),
            builder: (context, AsyncSnapshot<PekerjaanM> snapshot) {
              switch (controller.isLoading.value) {
                case true:
                  return const Center(child: CircularProgressIndicator());
                case false:
                  return Obx(() => cardDetailPekerjaan(
                      data: controller.detailPekerjaan.value));

                default:
                  return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
