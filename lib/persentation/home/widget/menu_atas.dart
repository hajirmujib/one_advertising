import 'package:cached_network_image/cached_network_image.dart';
import 'package:one_advertising/config/format_date.dart';
import 'package:one_advertising/controller/pekerjaan_c.dart';
import '../../../controller/user_c.dart';
import '../../../services/services.dart';
import '../../index.dart';

class MenuAtas extends GetView<PekerjaanC> {
  const MenuAtas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());

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
              Obx(
                () => Container(
                  width: 100.w,
                  color: Colors.white,
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/logo_one2.jpeg",
                        fit: BoxFit.contain,
                        width: 18.w,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "Hi, " +
                                  userController.profile.value.nama.toString(),
                              style: TextStyle(
                                  color: Colors.blue[900]!,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppin Bold"),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              userController.getProfile();
                              userController.idTemp.value = userController
                                  .profile.value.idAkun
                                  .toString();
                              userController.getDetailUser();
                              Get.toNamed(Routes.detailAkun);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.blue[600],
                                child: CachedNetworkImage(
                                  imageUrl: urlImage +
                                      userController.profile.value.foto
                                          .toString(),
                                  fit: BoxFit.cover,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),

                                  // width:
                                  //     24, //? ubah angka 10, untuk mengecilkan/membesarkan ukuran foto
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 7.w, top: 15.0),
                  child: Text(
                    getTgl(userController.formatted),
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
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircullarPercent(
                        title: "Pekerjaan",
                        number: controller.listPerkerjaanBaru.length.toString(),
                      ),
                      CircullarPercent(
                        title: "Proses",
                        number:
                            controller.listPerkerjaanProses.length.toString(),
                      ),
                      CircullarPercent(
                        title: "Selesai",
                        number:
                            controller.listPerkerjaanSelesai.length.toString(),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(() => Padding(
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
                              oCcy.format(
                                  int.parse(controller.pemasukan.value)),
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
                              oCcy.format(
                                  int.parse(controller.pengeluaran.value)),
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
                  )),
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
