import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_advertising/config/color.dart';
import 'package:one_advertising/config/curency_format.dart';
import 'package:one_advertising/config/enum.dart';
import 'package:one_advertising/controller/catatan_keuangan_c.dart';
import 'package:sizer/sizer.dart';

import '../../config/format_date.dart';

class DetailKeuangan extends StatelessWidget {
  DetailKeuangan({Key? key}) : super(key: key);
  final catatanK = Get.put(CatatanKeuanganC());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorApp.canvasColor,
        //!start kotak judul halaman
        appBar: AppBar(
          title: const Text(
            "Detail",
            style: TextStyle(
                color: Colors.white, //? warna judul halaman putih
                //? ubah white menjadi warna lain dalam bahasa inggriss
                fontWeight: FontWeight.w500,
                fontFamily: "Poppin Semi Bold"),
          ),
          actions: [
            //! start tombol edit
            IconButton(
                onPressed: () {
                  catatanK.keterangan.value.text =
                      catatanK.detailCatatan.value.keterangan.toString();
                  return catatanK.editKeterangan();
                },
                icon: const Icon(Icons.edit_outlined)),
            //! end tombol edit

            //! start tombol hapus
            IconButton(
                onPressed: () {
                  catatanK.deleteCatatanK();
                },
                icon: const Icon(CupertinoIcons.delete))
            //! end tombol hapus
          ],
        ),
        //! end koak judul halaman
        body: Container(
          width: 100.w,
          padding: const EdgeInsets.all(15.0),
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.white,
              //? warna background halaman putih
              //? ubah white menjadi warna lain dalam bahasa inggriss
              borderRadius: BorderRadius.circular(10)),
          child: Obx(
            () => catatanK.viewState.value == ViewState.busy
                ? const CircularProgressIndicator()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //! start teks tanggal
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Tanggal",
                              style: TextStyle(
                                  fontSize: 15, //? ukuran teks tanggal 15
                                  //? ubah angka 15 untuk mengecilkan atau membesarkan ukuran huruf
                                  color: Colors.black87, //? warna teks black87
                                  //? ubah black87 menjadi warna lain dalam bahasa inggris
                                  //? seperti red/ green/ blue
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppin Semi Bold"),
                            ),
                            Text(
                              getTgl(
                                  catatanK.detailCatatan.value.tgl.toString()),
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppin Semi Bold"),
                            ),
                          ],
                        ),
                      ),
                      //! end teks tanggal

                      //! start teks jenis
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Jenis",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppin Semi Bold"),
                            ),
                            Text(
                              catatanK.detailCatatan.value.jenis.toString(),
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppin Semi Bold"),
                            ),
                          ],
                        ),
                      ),
                      //! end teks jenis
                      //! start teks jumlah
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Jumlah",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppin Semi Bold"),
                            ),
                            Text(
                              oCcy.format(int.parse(catatanK
                                  .detailCatatan.value.jumlah
                                  .toString())),
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppin Semi Bold"),
                            ),
                          ],
                        ),
                      ),
                      //! end teks jumlah
                      Divider(
                        color: Colors.blue[900]!,
                      ),
                      //! start teks keterangan
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Text(
                          "Keterangan",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue[900]!,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppin Semi Bold"),
                        ),
                      ),
                      Container(
                        width: 100.w,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.blue[900]!, width: 1.0),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          ": " +
                              catatanK.detailCatatan.value.keterangan
                                  .toString(),
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppin Medium"),
                        ),
                      ),
                      //! end teks keterangan
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
