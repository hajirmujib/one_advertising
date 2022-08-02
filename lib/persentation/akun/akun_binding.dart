import 'package:get/get.dart';
import 'package:one_advertising/controller/user_c.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(
      () => UserController(),
    );
  }
}
