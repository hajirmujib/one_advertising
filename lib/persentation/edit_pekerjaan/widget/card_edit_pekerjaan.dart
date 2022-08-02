import 'package:one_advertising/controller/jenis_pekerjaan_c.dart';
import 'package:one_advertising/controller/pekerjaan_c.dart';
import 'package:one_advertising/model/pekerjaan_m.dart';

import '../../index.dart';
import 'input_widget.dart';

class CardPekerjaanEdit extends StatelessWidget {
  CardPekerjaanEdit({Key? key}) : super(key: key);
  final controller = Get.find<PekerjaanC>();
  final jenisP = Get.find<JenisPekerjaanC>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      width: 100.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "Jenis Pekerjaan",
                style: TextStyle(
                  fontFamily: "Poppin Semi Bold",
                  fontSize: 12.sp,
                ),
              ),
            ),
            Obx(() => Container(
                  width: 90.w,
                  height: 8.h,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue[900]!),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonFormField(
                    value: controller.jenisPekerjaan.value != ""
                        ? controller.jenisPekerjaan.value
                        : controller.detailPekerjaan.value.idJenis.toString(),
                    hint: const Text("Jenis Pekerjaan"),
                    isExpanded: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    items: jenisP.listJenisPerkerjaan
                        .map((e) => DropdownMenuItem(
                              child: Text(e.jenis.toString()),
                              value: e.idJenis,
                            ))
                        .toList(),
                    onChanged: (String? value) {
                      controller.jenisPekerjaan.value = value.toString();
                    },
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 15.0),
              child: Text(
                "Keterangan",
                style: TextStyle(
                  fontFamily: "Poppin Semi Bold",
                  fontSize: 12.sp,
                ),
              ),
            ),
            textInput(
                maxLines: 5,
                height: 15.h,
                controller: controller.keterangan.value),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 15.0),
              child: Text(
                "Nama Pelanggan",
                style: TextStyle(
                  fontFamily: "Poppin Semi Bold",
                  fontSize: 12.sp,
                ),
              ),
            ),
            textInput(
                height: 6.h,
                maxLines: 1,
                controller: controller.namaPelanggan.value),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 15.0),
              child: Text(
                "No. Telphone",
                style: TextStyle(
                  fontFamily: "Poppin Semi Bold",
                  fontSize: 12.sp,
                ),
              ),
            ),
            textInput(
                height: 6.h,
                maxLines: 1,
                textInputType: TextInputType.phone,
                controller: controller.notepPelanggan.value),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 15.0),
              child: Text(
                "Status Pekerjaan",
                style: TextStyle(
                  fontFamily: "Poppin Semi Bold",
                  fontSize: 12.sp,
                ),
              ),
            ),
            Container(
              width: 90.w,
              height: 8.h,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue[900]!),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonFormField(
                value: controller.statusPekerjaan.value != ""
                    ? controller.statusPekerjaan.value
                    : controller.detailPekerjaan.value.status.toString(),
                hint: const Text("Status Pekerjaan"),
                isExpanded: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                items: controller.listStatusPekerjaan
                    .map((e) => DropdownMenuItem(
                          child: Text(e.toString()),
                          value: e.toString(),
                        ))
                    .toList(),
                onChanged: (String? value) {
                  controller.statusPekerjaan.value = value.toString();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 15.0),
              child: Text(
                "Harga",
                style: TextStyle(
                  fontFamily: "Poppin Semi Bold",
                  fontSize: 12.sp,
                ),
              ),
            ),
            textInput(
                height: 6.h,
                maxLines: 1,
                textInputType: TextInputType.number,
                controller: controller.hargaPekerjaan.value),
          ],
        ),
      ),
    );
  }
}
