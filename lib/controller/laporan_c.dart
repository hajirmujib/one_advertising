import 'dart:io' as io;
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:one_advertising/model/laporan_m.dart';
import 'package:one_advertising/persentation/index.dart';
import 'package:one_advertising/services/services.dart';
import 'package:open_document/open_document.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LaporanController extends GetxController {
  //?list laporan
  final listLaporan = <LaporanM>[].obs;

  // ?view state reactive value
  final viewState = ViewState.initial.obs;
  //? view state history
  final historyViewState = <ViewState>[];
  final tanggalFrom = '28/07/2021'.obs;
  final tanggalUntil = '28/07/2021'.obs;
  final limitPage = 0.obs;
  int totalPengeluaran = 0;
  int totalPemasukan = 0;
  int pendapatanBersih = 0;
  // final dateTimeMin = DateTime(DateTime.now().year - 10, 9).obs;
  final dateTimeMin = "".obs;

  final dateTimeMax = "".obs;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  @override
  void onInit() {
    initializeDateFormatting();
    DateTime date = DateTime.now();
    final f = DateFormat('dd/MM/yyyy', 'id');

    tanggalFrom.value = f.format(date);
    tanggalUntil.value = f.format(date);
    dateTimeMin.value = "";
    dateTimeMax.value = "";
    getDataLaporan();
    super.onInit();
  }

  void setRangeFrom(String newTangal) {
    tanggalFrom.value = newTangal;
    // print("NEW TANGGAL :" + newTangal);

    // var dateFormat = newTangal.split('/');
    // dateTimeMin.value =
    //     DateTime.parse('${dateFormat[2]}-${dateFormat[1]}-${dateFormat[0]}');
    dateTimeMin.value = Jiffy(newTangal, "dd/MM/yyyy").format("yyyy-MM-dd");
    print(dateTimeMin.value);
  }

  void setRangeUntil(String newTangal) {
    tanggalUntil.value = newTangal;
    // var dateFormat = newTangal.split('/');
    // dateTimeMax.value =
    //     DateTime.parse('${dateFormat[2]}-${dateFormat[1]}-${dateFormat[0]}');
    dateTimeMax.value = Jiffy(newTangal, "dd/MM/yyyy").format("yyyy-MM-dd");
    print(dateTimeMax.value);
  }

  //?get data laporan
  Future<void> getDataLaporan() async {
    _setState(ViewState.busy);

    try {
      var dataBaru = await RestClient().request("laporan", Method.post, {
        "datemin": dateTimeMin.value,
        "datemax": dateTimeMax.value,
        "limit": limitPage.value
      });
      var responseDataBaru = LaporanModel.fromJson(dataBaru);

      if (dataBaru['status'] == true) {
        listLaporan.clear();
        listLaporan.addAll(responseDataBaru.data!);
      } else {
        listLaporan.clear();

        listLaporan.addAll([]);
      }
    } catch (e) {
      print(e.toString());

      _setState(ViewState.error);
    } finally {
      _setState(ViewState.data);
    }
  }

  void total() {
    totalPengeluaran = 0;
    totalPemasukan = 0;
    pendapatanBersih = 0;

    for (var i = 0; i < listLaporan.length; i++) {
      if (listLaporan[i].jenis == "Pengeluaran") {
        totalPengeluaran += int.parse(listLaporan[i].jumlah.toString());
        print("Pengeluaran" + listLaporan[i].jumlah.toString());
      }
    }
    for (var i = 0; i < listLaporan.length; i++) {
      if (listLaporan[i].jenis == "Pemasukan") {
        totalPemasukan += int.parse(listLaporan[i].jumlah.toString());
        print("Pemasukan" + listLaporan[i].jumlah.toString());
      }
    }
    pendapatanBersih = totalPemasukan - totalPengeluaran;
  }

  void onRefresh() async {
    DateTime date = DateTime.now();
    final f = DateFormat('dd/MM/yyyy', 'id');

    tanggalFrom.value = f.format(date);
    tanggalUntil.value = f.format(date);
    dateTimeMin.value = "";
    dateTimeMax.value = "";
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 100));
    // if failed,use refreshFailed()

    await getDataLaporan();
    await Future.delayed(const Duration(milliseconds: 1500));

    refreshController.refreshCompleted();
  }

  void onLoading() async {
    // monitor network fetch
    // limitPage.value += 5;
    await Future.delayed(const Duration(milliseconds: 1600));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // getDataLaporan();
    refreshController.loadComplete();
  }

  //? Buat pdf laporan
  Future<Uint8List> createInvoice() async {
    _setState(ViewState.busy);

    total();

    final pdf = pw.Document();

    final List<CustomRow> elements = [
      CustomRow("Jenis", "Tanggal", "Jumlah", "Keterangan"),
      for (var product in listLaporan)
        CustomRow(
          product.jenis!,
          product.tgl!.toString(),
          oCcy.format(int.parse(product.jumlah!)),
          (product.keterangan!),
        ),
    ];
    final data = elements
        .map((e) => [e.jenis, e.tanggal, e.jumlah, e.keterangan])
        .toList();
    final elementKet = [
      CustomRow(
        "Total Pengeluaran",
        "",
        "",
        oCcy.format(totalPengeluaran),
      ),
      CustomRow(
        "Total Pendapatan",
        "",
        "",
        oCcy.format(totalPemasukan),
      ),
      CustomRow(
        "Pendapatan Bersih",
        "",
        "",
        oCcy.format(pendapatanBersih),
      )
    ];
    final image = (await rootBundle.load("assets/images/logo_one2.jpeg"))
        .buffer
        .asUint8List();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Stack(children: [
            pw.Align(
              alignment: pw.Alignment.center,
              child: pw.Image(pw.MemoryImage(image),
                  width: 100, height: 100, fit: pw.BoxFit.cover),
            ),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Text(
                  "ONE ADVERTISING",
                  style: pw.TextStyle(
                      fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                pw.Text(
                  "Laporan Laba Rugi",
                  style: pw.TextStyle(fontSize: 16.sp),
                ),
                pw.SizedBox(height: 25),
                pw.Table.fromTextArray(data: data),
                pw.SizedBox(height: 25),
                itemColumn(elementKet)
              ],
            ),
          ]);
        },
      ),
    );

    _setState(ViewState.data);

    return pdf.save();
  }

  pw.Expanded itemColumn(List<CustomRow> elements) {
    return pw.Expanded(
      child: pw.Column(
        children: [
          for (var element in elements)
            pw.Row(
              children: [
                pw.Expanded(
                    child:
                        pw.Text(element.jenis, textAlign: pw.TextAlign.left)),
                pw.Expanded(
                    child: pw.Text(element.tanggal,
                        textAlign: pw.TextAlign.right)),
                pw.Expanded(
                    child:
                        pw.Text(element.jumlah, textAlign: pw.TextAlign.right)),
                pw.Expanded(
                    child: pw.Text(element.keterangan,
                        textAlign: pw.TextAlign.right)),
              ],
            )
        ],
      ),
    );
  }

  Future<void> savePdfFile(String fileName, Uint8List byteList) async {
    final output = await getApplicationDocumentsDirectory();
    var filePath = "${output.path}/$fileName.pdf";
    final file = File(filePath);
    await file.writeAsBytes(byteList);

    await OpenDocument.openDocument(filePath: filePath);
  }

  //? set viewstate
  void _setState(ViewState state) {
    viewState.value = state;
    historyViewState.add(state);
  }
}

class CustomRow {
  final String jenis;
  final String tanggal;
  final String jumlah;
  final String keterangan;

  CustomRow(this.jenis, this.tanggal, this.jumlah, this.keterangan);
}
