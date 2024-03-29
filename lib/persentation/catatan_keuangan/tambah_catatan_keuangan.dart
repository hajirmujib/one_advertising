import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_advertising/config/color.dart';
import 'package:one_advertising/controller/catatan_keuangan_c.dart';
import 'package:sizer/sizer.dart';

class TambahCatatanKeuangan extends StatelessWidget {
  TambahCatatanKeuangan({Key? key}) : super(key: key);

  final catatanK = Get.put(CatatanKeuanganC());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorApp.canvasColor,
        appBar: AppBar(
          title: const Text(
            "Tambah Catatan Keuangan",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: "Poppin Semi Bold"),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: 100.w,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Jumlah",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppin Semi Bold"),
                ).marginOnly(bottom: 10),
                SizedBox(
                  width: 80.w,
                  child: TextFormField(
                    controller: catatanK.jumlah.value,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue[900]!),
                            borderRadius: BorderRadius.circular(10))),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Divider(
                  color: Colors.blue[900]!,
                ),
                const Text(
                  "Jenis",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppin Semi Bold"),
                ).marginOnly(bottom: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        catatanK.statusJenis.value = "Pengeluaran";
                      },
                      child: Obx(() => Container(
                            padding: const EdgeInsets.all(10),
                            width: 40.w,
                            decoration: BoxDecoration(
                              color: catatanK.statusJenis.value == "Pengeluaran"
                                  ? Colors.blue[900]!
                                  : Colors.white,
                              border: Border.all(
                                  width: 1.0, color: Colors.blue[900]!),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                "Pengeluaran",
                                style: TextStyle(
                                    color: catatanK.statusJenis.value ==
                                            "Pengeluaran"
                                        ? Colors.white
                                        : Colors.blue[900]!,
                                    fontFamily: "Poppin Semi Bold"),
                              ),
                            ),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        catatanK.statusJenis.value = "Pemasukan";
                      },
                      child: Obx(() => Container(
                            padding: const EdgeInsets.all(10),
                            width: 40.w,
                            decoration: BoxDecoration(
                              color: catatanK.statusJenis.value == "Pemasukan"
                                  ? Colors.blue[900]!
                                  : Colors.white,
                              border: Border.all(
                                  width: 1.0, color: Colors.blue[900]!),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                "Pemasukan",
                                style: TextStyle(
                                    color: catatanK.statusJenis.value ==
                                            "Pemasukan"
                                        ? Colors.white
                                        : Colors.blue[900]!,
                                    fontFamily: "Poppin Semi Bold"),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.blue[900]!,
                ),
                const Text(
                  "Keterangan",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppin Semi Bold"),
                ).marginOnly(bottom: 10),
                SizedBox(
                  width: 80.w,
                  height: 17.h,
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    controller: catatanK.keterangan.value,
                    maxLines: 5,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue[900]!),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Divider(
                  color: Colors.blue[900]!,
                ),
                InkWell(
                  onTap: () {
                    catatanK.addCatatanK();
                  },
                  child: Container(
                    width: 200,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blue[900]!,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        "Simpan",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: "Poppin Semi Bold",
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                // ElevatedButton(
                //     onPressed: () {
                //       catatanK.addCatatanK();
                //     },
                //     child: const Text("Simpan"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
