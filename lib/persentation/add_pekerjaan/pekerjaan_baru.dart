import 'package:flutter/cupertino.dart';
import 'package:one_advertising/controller/jenis_pekerjaan_c.dart';
import 'package:one_advertising/controller/pekerjaan_c.dart';
import 'package:one_advertising/persentation/add_pekerjaan/widget/card_add_pekerjaan.dart';

import '../index.dart';

class PekerjaanBaru extends GetView<PekerjaanC> {
  PekerjaanBaru({Key? key}) : super(key: key);
  final jenisP = Get.put(JenisPekerjaanC());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          backgroundColor: ColorApp.canvasColor,
          appBar: AppBar(
            title: const Text(
              "Pekerjaan Baru",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppin Semi Bold"),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    controller.addPekerjaan();
                  },
                  icon: const Icon(CupertinoIcons.check_mark))
            ],
          ),
          body: Obx(() {
            switch (controller.viewState.value) {
              case ViewState.busy:
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue[900],
                  ),
                );

              case ViewState.error:
                return const Center(child: Text("Error :("));
              case ViewState.data:
                return CardPekerjaanBaru();
              default:
                return SizedBox(
                  width: 100.w,
                  height: 100.h,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue[900],
                    ),
                  ),
                );
            }
          }),
        ),
      ),
    );
  }
}
