import 'package:one_advertising/controller/pekerjaan_c.dart';

import '../../index.dart';
import 'input_widget.dart';

class CardPekerjaanBaru extends StatelessWidget {
  CardPekerjaanBaru({Key? key}) : super(key: key);
  final controller = Get.find<PekerjaanC>();

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
            Container(
              width: 90.w,
              height: 8.h,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue[900]!),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonFormField(
                value: "Stempel",
                hint: const Text("Jenis Pekerjaan"),
                isExpanded: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                items: const [
                  DropdownMenuItem(
                    child: Text("Stempel"),
                    value: "Stempel",
                  ),
                  DropdownMenuItem(
                    child: Text("Spanduk"),
                    value: "Spanduk",
                  ),
                  DropdownMenuItem(
                    child: Text("Stiker"),
                    value: "Stiker",
                  ),
                  DropdownMenuItem(
                    child: Text("Yasin"),
                    value: "Yasin",
                  ),
                  DropdownMenuItem(
                    child: Text("Id Card"),
                    value: "Id Card",
                  ),
                  DropdownMenuItem(
                    child: Text("Name Tag"),
                    value: "Name Tag",
                  ),
                  DropdownMenuItem(
                    child: Text("Neonbox"),
                    value: "Neonbox",
                  ),
                  DropdownMenuItem(
                    child: Text("Plakat"),
                    value: "Plakat",
                  ),
                  DropdownMenuItem(
                    child: Text("Buku"),
                    value: "Buku",
                  ),
                  DropdownMenuItem(
                    child: Text("Sablon"),
                    value: "Sablon",
                  ),
                  DropdownMenuItem(
                    child: Text("Brosur"),
                    value: "Brosur",
                  ),
                  DropdownMenuItem(
                    child: Text("Nota"),
                    value: "Nota",
                  ),
                  DropdownMenuItem(
                    child: Text("Undangan"),
                    value: "Undangan",
                  )
                ],
                onChanged: (String? value) {
                  controller.jenisPekerjaan.value = value!;
                },
              ),
            ),
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
          ],
        ),
      ),
    );
  }
}
