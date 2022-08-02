import 'package:one_advertising/controller/user_c.dart';
import 'package:one_advertising/persentation/akun/widgets/list_akun.dart';

import '../index.dart';

class DaftarAkun extends GetView<UserController> {
  const DaftarAkun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.addAkun),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        backgroundColor: ColorApp.canvasColor,
        appBar: AppbarApp(
          appBar: AppBar(),
          title: "Daftar Akun", //?judul
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
              return const ListAkun();
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
