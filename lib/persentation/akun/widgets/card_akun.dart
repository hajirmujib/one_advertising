import '../../index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:one_advertising/services/services.dart';

Widget cardAkun({String? image, String? nama, String? level}) {
  return Container(
    width: 100.w, //? lebar kotak, ubah angka 100 untuk mengecilkan lebarnya
    height: 13.h, //? tinggi kotak, ubah angak 13 untuk merubah tinggi kotak
    color: Colors.white,
    padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 2.h),
    margin: EdgeInsets.only(bottom: 1.h),
    child: Row(
      children: [
        //!foto profile

        CachedNetworkImage(
          imageUrl: urlImage + image.toString(),
          fit: BoxFit.fill,
          width:
              10.w, //? ubah angka 10, untuk mengecilkan/membesarkan ukuran foto
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),

        Padding(
          padding: const EdgeInsets.only(
              left: 10.0), //?jarak kiri 10, ubah angka 10 untuk mengatur jarak
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //!teks nama
              Text(nama.toString(),
                  style: TextStyle(
                      //? Colors.blue[900],ubah blue menjadi yellow / red/ green
                      color: Colors.blue[900]!,
                      fontSize: 18, //?ubah angak 18 untuk merubah ukuran huruf
                      fontFamily: "Poppin Semi Bold")),
              //!teks level
              Text(level.toString(),
                  style: TextStyle(
                      //? Colors.blue[900],ubah blue menjadi yellow / red/ green
                      color: Colors.blue[900]!,
                      //? font size,ubah angka 15 untuk merubah ukuran huruf
                      fontSize: 15,
                      fontFamily: "Poppin Semi Bold")),
            ],
          ),
        ),
      ],
    ),
  );
}
