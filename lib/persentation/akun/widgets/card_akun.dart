import '../../index.dart';

Widget cardAkun({String? image, String? nama, String? level}) {
  return Container(
    width: 100.w,
    height: 13.h,
    color: Colors.white,
    padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 2.h),
    margin: EdgeInsets.only(bottom: 1.h),
    child: Row(
      children: [
        Image.asset(
          image.toString(),
          width: 10.w,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nama.toString(),
                  style: TextStyle(
                      color: Colors.blue[900]!,
                      fontSize: 18,
                      fontFamily: "Poppin Semi Bold")),
              Text(level.toString(),
                  style: TextStyle(
                      color: Colors.blue[900]!,
                      fontSize: 15,
                      fontFamily: "Poppin Semi Bold")),
            ],
          ),
        ),
      ],
    ),
  );
}
