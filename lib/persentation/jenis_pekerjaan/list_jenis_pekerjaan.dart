import 'package:one_advertising/controller/jenis_pekerjaan_c.dart';
import 'package:one_advertising/persentation/jenis_pekerjaan/widget/widget_list_jenis_pekerjaan.dart';

import '../index.dart';

class DaftarJenisPekerjaan extends GetView<JenisPekerjaanC> {
  const DaftarJenisPekerjaan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => controller.addJenis(),
          child: const Icon(Icons.add),
        ),
        backgroundColor: ColorApp.canvasColor,
        appBar: AppBar(
          title: const Text(
            "Daftar Jenis Pekerjaan",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: "Poppin Semi Bold"),
          ),
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
              return const WidgetListJenisPekerjaan();
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
    );
  }
}
