import 'package:one_advertising/controller/pekerjaan_c.dart';
import '../index.dart';
import 'widget/list_pekerjaan.dart';

class DaftarPekerjaan extends GetView<PekerjaanC> {
  const DaftarPekerjaan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: ColorApp.canvasColor,
          appBar: AppBar(
            title: const Text(
              "Daftar Pekerjaan",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppin Semi Bold"),
            ),
            bottom: TabBar(
                padding: EdgeInsets.only(left: 2.w, right: 2.w),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                unselectedLabelStyle:
                    TextStyle(fontFamily: "Poppin Medium", fontSize: 11.sp),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blue[900]!,
                ),
                labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontFamily: "Poppin Medium"),
                tabs: const [
                  Tab(
                    text: "Baru",
                  ),
                  Tab(
                    text: "Proses",
                  ),
                  Tab(
                    text: "Selesai",
                  )
                ]),
            // actions: actions,
            centerTitle: true,
            elevation: 0.0,
            automaticallyImplyLeading: true,
          ),
          body: Obx(() {
            switch (controller.viewState.value) {
              case ViewState.busy:
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue[900],
                  ),
                );
              case ViewState.error:
                return const Center(child: Text("Error :("));
              case ViewState.data:
                return TabBarView(
                  children: [
                    ListPekerjaan(
                      list: controller.listPerkerjaanBaru,
                      fetch: controller.getPekerjaanBaru,
                    ),
                    ListPekerjaan(
                      list: controller.listPerkerjaanProses,
                      fetch: controller.getPekerjaanProses,
                    ),
                    ListPekerjaan(
                      list: controller.listPerkerjaanSelesai,
                      fetch: controller.getPekerjaanSelesai,
                    ),
                  ],
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
    );
  }
}
