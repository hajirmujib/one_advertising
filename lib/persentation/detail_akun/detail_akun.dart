import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:one_advertising/controller/user_c.dart';
import 'package:one_advertising/model/user_model.dart';

import '../index.dart';
import 'widget/box_bottom_detail_akun.dart';
import 'widget/box_top_detail_akun.dart';

class DetailAkun extends GetView<UserController> {
  const DetailAkun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorApp.canvasColor,
          appBar: controller.filePath.value != ""
              ? null
              : AppBar(
                  elevation: 0.0,
                  backgroundColor: Colors.blue[900]!,
                  title: Text(
                    "Detail Akun",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontFamily: "Poppin Semi Bold"),
                  ),
                ),
          body: Stack(
            children: [
              Obx(
                () => SizedBox(
                  child: controller.viewState.value == ViewState.busy
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              ContainerAtas(
                                image:
                                    controller.detailAkun.value.foto.toString(),
                              ),
                              ContainerBawah(
                                data: controller.detailAkun.value,
                              ),
                            ],
                          ),
                        ),
                ),
              ),
              Obx(() => Visibility(
                    visible: controller.filePath.value != "" ? true : false,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        color: Colors.black,
                        width: 100.w,
                        height: 100.h,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: IconButton(
                                onPressed: () {
                                  controller.fileController = File("");
                                  controller.filePath.value = "";

                                  // print(controller.filePath.value);
                                },
                                icon: const Icon(Icons.close),
                                color: Colors.white,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: () {
                                  controller.editUser();
                                },
                                icon: const Icon(Icons.done),
                                color: Colors.white,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Image.file(
                                File(controller.fileController.path),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            ],
          )),
    );
  }
}
