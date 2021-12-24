import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_advertising/config/color.dart';
import 'package:one_advertising/persentation/catatan_keuangan/catatan_keuangan_c.dart';
import 'package:sizer/sizer.dart';

class DetailPekerjaan extends StatelessWidget {
  DetailPekerjaan({Key? key}) : super(key: key);
  final catatanK = Get.put(CatatanKeuanganC());

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
                onPressed: () {
                  return catatanK.editKeterangan();
                },
                icon: const Icon(Icons.edit_outlined)),
            IconButton(
                onPressed: () {}, icon: const Icon(CupertinoIcons.delete))
          ],
        ),
        body: Container(
          width: 100.w,
          padding: const EdgeInsets.all(15.0),
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Tanggal",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppin Semi Bold"),
                    ),
                    Text(
                      "20 November 2021 13:25:00",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppin Semi Bold"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Nama",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppin Semi Bold"),
                    ),
                    Text(
                      "Safrial",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppin Semi Bold"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "No.Telp",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppin Semi Bold"),
                    ),
                    Text(
                      "082377xxxx",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppin Semi Bold"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Jenis",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppin Semi Bold"),
                    ),
                    Text(
                      "Sablon",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppin Semi Bold"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Harga",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppin Semi Bold"),
                    ),
                    Text(
                      "Rp. 50.000",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppin Semi Bold"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Status Pekerjaan",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppin Semi Bold"),
                    ),
                    Text(
                      "Belum DiKerjakan",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppin Semi Bold"),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.blue[900]!,
              ),
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
                    border: Border.all(color: Colors.blue[900]!, width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  ": 2x3, dominan warna ungu dan putih, gambar makanan ada 3 di bawah tengah",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppin Medium"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}