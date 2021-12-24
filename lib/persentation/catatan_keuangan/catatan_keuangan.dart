import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_advertising/config/color.dart';
import 'package:one_advertising/persentation/catatan_keuangan/detail_keuangan.dart';
import 'package:one_advertising/persentation/catatan_keuangan/tambah_catatan_keuangan.dart';
import 'package:sizer/sizer.dart';

class CatatanKeuangan extends StatelessWidget {
  const CatatanKeuangan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => TambahCatatanKeuangan());
          },
          child: const Icon(CupertinoIcons.add),
        ),
        backgroundColor: ColorApp.canvasColor,
        appBar: AppBar(
          title: const Text(
            "Catatan Keuangan",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: "Poppin Semi Bold"),
          ),
        ),
        body: ListView(
          children: [
            InkWell(
              onTap: () => Get.to(() => DetailKeuangan()),
              child: Container(
                  width: 100.w,
                  height: 13.h,
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 2.h),
                  margin: EdgeInsets.only(bottom: 1.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("20 Nov 2021",
                              style: TextStyle(
                                  color: Colors.blue[900]!,
                                  fontSize: 15,
                                  fontFamily: "Poppin Semi Bold")),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.blue[900]!,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text("Pengeluaran",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: "Poppin Semi Bold")),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Rp. 50.000",
                            style: TextStyle(
                                color: Colors.blue[900]!,
                                fontSize: 18,
                                fontFamily: "Poppin Semi Bold")),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
