import 'package:auto_animated/auto_animated.dart';
import 'package:intl/intl.dart';
import 'package:one_advertising/config/date_time.dart';
import 'package:one_advertising/controller/laporan_c.dart';
import 'package:one_advertising/model/laporan_m.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../index.dart';

class LaporanView extends StatelessWidget {
  const LaporanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LaporanController());
    const options = LiveOptions(
      delay: Duration(seconds: 1),
      showItemInterval: Duration(milliseconds: 400),
      showItemDuration: Duration(seconds: 1),
      visibleFraction: 0.05,
      reAnimateOnVisibility: false,
    );
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Laporan", //?judul halaman
              style: TextStyle(
                  color: Colors.white, //?warna teks judul putih
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppin Semi Bold"),
            ),
            actions: [
              IconButton(
                  iconSize: 30,
                  onPressed: () async {
                    // controller.createPdf();
                    final data = await controller.createInvoice();
                    controller.savePdfFile("laporan_one", data);
                  },
                  icon: const Icon(Icons.picture_as_pdf_outlined))
            ],
          ),
          body: ListView(
            // physics: const NeverScrollableScrollPhysics(),
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        child: DateRangeButton(
                          date: controller.tanggalFrom.value,
                          onTap: () {
                            showwDatePickerForWithDraw(
                                minTime: DateTime(DateTime.now().year - 10, 9),
                                // maxTime: controller.dateTimeMin.value == ""
                                //     ? DateTime.now()
                                //     : DateTime.parse(
                                //         controller.dateTimeMin.value),
                                maxTime: DateTime.now(),
                                context: context,
                                onChanged: (date) {
                                  final f = DateFormat('dd/MM/yyyy', 'id');
                                  controller.setRangeFrom(f.format(date));
                                });
                          },
                        ),
                      ),
                      const SizedBox(width: 15),
                      Flexible(
                        flex: 2,
                        child: DateRangeButton(
                          date: controller.tanggalUntil.value,
                          onTap: () {
                            showwDatePickerForWithDraw(
                                minTime: DateTime(DateTime.now().year - 10, 9),
                                maxTime: controller.dateTimeMax.value == ""
                                    ? DateTime.now()
                                    : DateTime.parse(
                                        controller.dateTimeMax.value),
                                // maxTime: DateTime.now(),
                                context: context,
                                onChanged: (date) {
                                  final f = DateFormat('dd/MM/yyyy', 'id');
                                  controller.setRangeUntil(f.format(date));
                                });
                          },
                        ),
                      ),
                      const SizedBox(width: 15),
                      ButtonFilter(
                        onTap: () {
                          controller.getDataLaporan();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 70.h,
                width: 100.w,
                child: SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  onRefresh: () {
                    controller.onRefresh();
                  },
                  onLoading: () {
                    controller.onLoading();
                  },
                  controller: controller.refreshController,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.zero,
                    physics: const ScrollPhysics(),
                    child: Obx(() {
                      switch (controller.viewState.value) {
                        case ViewState.busy:
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.blue[900],
                            ),
                          );
                        case ViewState.initial:
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.blue[900],
                            ),
                          );
                        case ViewState.error:
                          return const Center(child: Text("Error :("));
                        case ViewState.data:
                          return controller.listLaporan.isEmpty
                              ? Center(
                                  child: SizedBox(
                                      height: 200,
                                      width: 200,
                                      child: emptyData),
                                )
                              : LiveList.options(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding:
                                      EdgeInsets.only(bottom: Get.height * 0.6),
                                  options: options,
                                  itemCount: controller.listLaporan.length,
                                  itemBuilder: (context, index, animation) {
                                    return buildAnimatedItem(context, index,
                                        animation, controller.listLaporan);
                                  },
                                );
                        default:
                          return SizedBox(
                            width: 100.w,
                            height: 100.h,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.blue[900],
                              ),
                            ),
                          );
                      }
                    }),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

Widget buildAnimatedItem(BuildContext context, int index,
    Animation<double> animation, List<LaporanM> listDataWithdrawHistori) {
  LaporanM x = listDataWithdrawHistori[index];
  return FadeTransition(
    opacity: Tween<double>(
      begin: 0,
      end: 1,
    ).animate(animation),
    child: SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, -0.1),
        end: Offset.zero,
      ).animate(animation),
      child: Container(
          width: 100.w, //?ubah angak 100 untuk mengecilkan /melebarkan kotak
          height: 13.h, //?ubah angka 13 untuk memendekan/meninggikan kotak
          color: Colors
              .white, //?warna kotak putih, ubah white menjadi red / green / blue, sesuaiakan
          padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 2.h),
          margin: EdgeInsets.only(bottom: 1.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.book,
                    color: ColorApp.blue3,
                    size: 35,
                  ).marginOnly(right: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(x.tgl.toString(),
                          style: TextStyle(
                              color: Colors.blue[
                                  900]!, //?teks tanggal warna biru, ubah blue menjadi warna lain dalam bahasa inggris
                              fontSize: 15, //?ukuran huruf teks tanggal 15
                              //?ubah angka 15 untuk mengecilkan atau membesarkan huruf
                              fontFamily: "Poppin Semi Bold")),
                      //! start teks harga
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                            oCcy.format(
                                int.parse(x.jumlah.toString())), //? teks harga
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
                  ),
                ],
              ),
              //! start kotak biru pengeluaran/pendapatan
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: BoxDecoration(
                  color: x.jenis == "Pemasukan"
                      ? Colors.blue[800]!
                      : Colors.red[
                          800], //? warna kotak biru, ubah warna blue menjadi red/ green /yellow sesuaikan
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
          )),
    ),
  );
}

class ButtonFilter extends StatelessWidget {
  final Function()? onTap;
  const ButtonFilter({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Colors.blue[900],
        child: InkWell(
          onTap: onTap,
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
              child: Icon(
                Icons.chevron_right,
                color: Colors.white,
                size: 30,
              )),
        ),
      ),
    );
  }
}

class DateRangeButton extends StatelessWidget {
  final String? date;
  final Function()? onTap;

  const DateRangeButton({Key? key, this.date, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(date!,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppin Regular')),
              const SizedBox(width: 10),
              const Icon(
                Icons.date_range,
                size: 15,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
