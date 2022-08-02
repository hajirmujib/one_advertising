import 'package:one_advertising/controller/auth_c.dart';

import '../index.dart';

import 'widget/container_atas.dart';
import 'widget/container_bawah.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authC = Get.put(AuthC());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() {
          switch (authC.viewState.value) {
            case ViewState.busy:
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorApp.primaryColor,
                ),
              );

            case ViewState.error:
              return const Center(child: Text("Error :("));
            case ViewState.data:
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const Align(
                        alignment: Alignment.topCenter,
                        child: ContainerAtasLogin()),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: containerBawah()),
                  ],
                ),
              );
            case ViewState.initial:
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const Align(
                        alignment: Alignment.topCenter,
                        child: ContainerAtasLogin()),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: containerBawah()),
                  ],
                ),
              );
            default:
              return SizedBox(
                width: 100.w,
                height: 100.h,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: ColorApp.primaryColor,
                  ),
                ),
              );
          }
        }),
      ),
    );
  }
}
