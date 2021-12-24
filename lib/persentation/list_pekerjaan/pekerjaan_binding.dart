import 'package:get/get.dart';
import '../../../controller/pekerjaan_c.dart';

class PekerjaanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PekerjaanC>(
      () => PekerjaanC(),
    );
  }
}
