import 'package:flutter/cupertino.dart';
import 'package:one_advertising/controller/pekerjaan_c.dart';
import 'package:one_advertising/persentation/edit_pekerjaan/widget/card_edit_pekerjaan.dart';

import '../index.dart';

class EditPekerjaan extends GetView<PekerjaanC> {
  const EditPekerjaan({Key? key}) : super(key: key);
  // final jenisP = Get.put(JenisPekerjaanC());

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
              "Edit Data Pekerjaan",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppin Semi Bold"),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    controller.editPekerjaan();
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
                return CardPekerjaanEdit();
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
