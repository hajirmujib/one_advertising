import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_advertising/core_widgets/cirucular_percentage.dart';
import 'package:one_advertising/routes/app_routes.dart';
import 'package:sizer/sizer.dart';

class MenuAtas extends StatelessWidget {
  const MenuAtas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 60.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blue[600]!,
            Colors.blue[700]!,
            Colors.blue[800]!,
            Colors.blue[900]!
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Center(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 7.w, top: 15.0),
                  child: Text(
                    "20 November 2021",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppin Medium"),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                height: 20.h,
                width: 85.w,
                decoration: BoxDecoration(
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    CircullarPercent(
                      title: "Pekerjaan",
                      number: "5",
                    ),
                    CircullarPercent(
                      title: "Proses",
                      number: "2",
                    ),
                    CircullarPercent(
                      title: "Selesai",
                      number: "3",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Pemasukan",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppin Medium"),
                        ),
                        Text(
                          "Rp. 200.000",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppin Semi Bold"),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Pengeluaran",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppin Medium"),
                        ),
                        Text(
                          "Rp. 50.000",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppin Semi Bold"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.listCatatanUang),
                  child: Text(
                    "Catatan Keuangan",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppin Semi Bold"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
