import 'package:one_advertising/controller/pekerjaan_c.dart';
import 'package:one_advertising/model/pekerjaan_m.dart';
import 'package:one_advertising/persentation/pekerjaan/detail_pekerjaan.dart';

import '../../index.dart';

class ListPekerjaan extends GetView<PekerjaanC> {
  const ListPekerjaan({
    required this.list,
    required this.fetch,
    Key? key,
  }) : super(key: key);
  final List<PekerjaanM> list;
  final Function fetch;

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      return UnDraw(
        padding: EdgeInsets.all(20.w),
        illustration: UnDrawIllustration.empty,
        fit: BoxFit.contain,
        color: Colors.blue,
      );
    }
    return RefreshIndicator(
      onRefresh: () async {
        fetch;
      },
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, i) {
          PekerjaanM x = list[i];
          return InkWell(
            onTap: () {
              controller.idTemp.value = x.idPekerjaan.toString();
              Get.to(() => const DetailPekerjaan());
            },
            child: Container(
              width: 100.w,
              height: 16.h,
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 2.h),
              margin: EdgeInsets.only(bottom: 1.h),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(x.tglMasuk.toString(),
                        style: TextStyle(
                            color: Colors.blue[900]!,
                            fontSize: 12.sp,
                            fontFamily: "Poppin Semi Bold")),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(x.jenis.toString(),
                        style: TextStyle(
                            color: Colors.blue[900]!,
                            fontSize: 15.sp,
                            fontFamily: "Poppin Semi Bold")),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(x.nama.toString(),
                        style: TextStyle(
                            color: Colors.blue[900]!,
                            fontSize: 12.sp,
                            fontFamily: "Poppin Semi Bold")),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
