import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatatanKeuanganC extends GetxController {
  var statusJenis = "Pengeluaran".obs;

  void editKeterangan() {
    Get.defaultDialog(
      title: "Edit Keterangan",
      content: TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue[900]!),
          borderRadius: BorderRadius.circular(10),
        )),
      ),
      textCancel: "Batal",
      textConfirm: "Edit",
      confirmTextColor: Colors.white,
    );
  }
}
