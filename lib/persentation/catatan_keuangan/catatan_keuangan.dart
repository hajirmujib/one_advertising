import 'package:flutter/cupertino.dart';
import 'package:one_advertising/controller/catatan_keuangan_c.dart';
import 'package:one_advertising/model/catatan_keuangan_m.dart';
import 'package:one_advertising/persentation/catatan_keuangan/detail_keuangan.dart';
import 'package:one_advertising/persentation/catatan_keuangan/tambah_catatan_keuangan.dart';
import 'package:one_advertising/persentation/index.dart';

import '../../config/format_date.dart';

class CatatanKeuangan extends StatelessWidget {
  const CatatanKeuangan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CatatanKeuanganC());
    return SafeArea(
      child: Scaffold(
        //!start tombol bulat kanan bawah
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() =>
                TambahCatatanKeuangan()); //?jika tombol di klik pindah ke halaman tambah catatan keuangan
          },
          child: const Icon(CupertinoIcons
              .add), //? icon add, teks add bisa diubah menjadi minus atau yang lainya
        ),
        //!end tombol bulat kanan bawah
        backgroundColor: ColorApp.canvasColor,
        //!start kotak judul halaman
        appBar: AppBar(
          title: const Text(
            "Catatan Keuangan", //?judul halaman
            style: TextStyle(
                color: Colors.white, //?warna teks judul putih
                fontWeight: FontWeight.w500,
                fontFamily: "Poppin Semi Bold"),
          ),
        ),
        //!end kotak judul halaman
        body: Obx(
          () => SizedBox(
            width: Get.width,
            height: Get.height,
            child: ListView.builder(
                itemCount: controller.listCataan.length,
                itemBuilder: (context, i) {
                  CatatanK x = controller.listCataan[i];
                  return //!start kotak card catatan keuangan
                      InkWell(
                    onTap: () {
                      controller.idTemp.value = x.id.toString();
                      controller.getDetailCatatanKeuangan();
                      Get.to(() => DetailKeuangan());
                    }, //? jika kotak di klik maka pindah ke halaman detailkeuangan
                    child: Container(
                        width: 100
                            .w, //?ubah angak 100 untuk mengecilkan /melebarkan kotak
                        height: 13
                            .h, //?ubah angka 13 untuk memendekan/meninggikan kotak
                        color: Colors
                            .white, //?warna kotak putih, ubah white menjadi red / green / blue, sesuaiakan
                        padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 2.h),
                        margin: EdgeInsets.only(bottom: 1.h),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //!teks tanggal
                                Text(getTgl(x.tgl.toString()),
                                    style: TextStyle(
                                        color: Colors.blue[
                                            900]!, //?teks tanggal warna biru, ubah blue menjadi warna lain dalam bahasa inggris
                                        fontSize:
                                            15, //?ukuran huruf teks tanggal 15
                                        //?ubah angka 15 untuk mengecilkan atau membesarkan huruf
                                        fontFamily: "Poppin Semi Bold")),
                                //!end teks tanggal

                                //! start kotak biru pengeluaran/pendapatan
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  decoration: BoxDecoration(
                                    color: x.jenis == "Pemasukan"
                                        ? Colors.blue[800]!
                                        : Colors.red[
                                            800], //? ubah warna menjadi red/ green /yellow sesuaikan
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(x.jenis.toString(),
                                      style: const TextStyle(
                                          color: Colors
                                              .white, //? warna teks pengeluaran / pendapatan warna putih
                                          //? ubah white menjadi warna lain dalam bahasa inggriss
                                          fontSize:
                                              12, //? ubah angka 12 untuk mengecilkan atau membesarkan huruf pengeluaran / pendapatan
                                          fontFamily: "Poppin Semi Bold")),
                                ),
                                //!end kotak biru pengeluaran/pendapatan
                              ],
                            ),
                            //! start teks harga
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                  oCcy.format(int.parse(
                                      x.jumlah.toString())), //? teks harga
                                  style: TextStyle(
                                      color: Colors.blue[
                                          900]!, //? warna huruf teks harga biru (blue)
                                      //? ubah blue menjadi warna lain dalam bahasa inggriss
                                      fontSize: 18, //? ukuran teks harga 18
                                      //? ubah angak 18 untuk mengecilkan atau membesarkan huruf
                                      fontFamily: "Poppin Semi Bold")),
                            ),
                            //! end teks harga
                          ],
                        )),
                  );
                  //! end kotak card catatan keuangan
                }),
          ),
        ),
      ),
    );
  }
}
