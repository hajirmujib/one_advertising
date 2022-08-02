import 'package:get/get.dart';
import 'package:one_advertising/controller/jenis_pekerjaan_c.dart';

class JenisPekerjaanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JenisPekerjaanC>(
      () => JenisPekerjaanC(),
    );
  }
}
