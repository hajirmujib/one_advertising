import 'package:one_advertising/model/pekerjaan_m.dart';
import 'package:one_advertising/persentation/pekerjaan/detail_pekerjaan.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../index.dart';

class ListPekerjaanBaru extends StatelessWidget {
  ListPekerjaanBaru({
    required this.list,
    required this.fetch,
    Key? key,
  }) : super(key: key);
  final List<PekerjaanModel> list;
  final Function fetch;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

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
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: () {
        fetch;
      },
      onLoading: () {
        fetch;
      },
      enablePullUp: true,
      header: const ClassicHeader(),
      // header: const WaterDropHeader(),
      physics: const BouncingScrollPhysics(),
      footer: const ClassicFooter(
        loadStyle: LoadStyle.ShowWhenLoading,
        completeDuration: Duration(milliseconds: 500),
      ),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, i) {
          PekerjaanModel x = list[i];
          return InkWell(
            onTap: () => Get.to(() => DetailPekerjaan()),
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
                    child: Text(x.tanggal.toString(),
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
