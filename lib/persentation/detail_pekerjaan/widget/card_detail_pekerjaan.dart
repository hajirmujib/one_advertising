import 'package:one_advertising/model/pekerjaan_m.dart';

import '../../index.dart';

Widget cardDetailPekerjaan({required PekerjaanM data}) {
  return Container(
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
            children: [
              const Text(
                "Tanggal",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppin Semi Bold"),
              ),
              Text(
                data.tglMasuk.toString(),
                style: const TextStyle(
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
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Nama",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppin Semi Bold"),
              ).marginOnly(right: 100),
              Flexible(
                fit: FlexFit.loose,
                child: Text(
                  data.nama.toString(),
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppin Semi Bold"),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "No.Telp",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppin Semi Bold"),
              ),
              Text(
                data.noTelp.toString(),
                style: const TextStyle(
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
                data.jenis.toString(),
                style: const TextStyle(
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
            children: [
              const Text(
                "Harga",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppin Semi Bold"),
              ),
              Text(
                oCcy.format(
                  int.parse(data.harga.toString()),
                ),
                style: const TextStyle(
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
            children: [
              const Text(
                "Status Pekerjaan",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppin Semi Bold"),
              ),
              Text(
                data.status.toString(),
                style: const TextStyle(
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
          child: Text(
            data.keterangan.toString(),
            style: const TextStyle(
                fontSize: 15,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontFamily: "Poppin Medium"),
          ),
        ),
      ],
    ),
  );
}
