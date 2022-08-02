import 'package:one_advertising/controller/auth_c.dart';

import '../../index.dart';
import 'widget_textfiled_login.dart';

Widget containerBawah() {
  final authC = Get.find<AuthC>();
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      padding: const EdgeInsets.all(25),
      width: 100.w,
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.blue[700],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Text(
            "Login",
            style: TextStyle(
                fontSize: 18.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ).marginOnly(bottom: 20),
          textFieldLogin(hintText: "Username", controller: authC.email.value),
          Obx(
            () => textFieldLogin(
              controller: authC.pass.value,
              hintText: "Password",
              obscureText: authC.isShow.value,
              suffix: IconButton(
                  onPressed: () {
                    authC.changeIsShow();
                  },
                  icon: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  )),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(
                Size(80.w, 100.h / 14),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () => authC.login(),
            child: Text(
              "Login",
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.blue[700],
                  fontWeight: FontWeight.w700),
            ),
          ).marginOnly(top: 40, bottom: 0),
        ],
      ),
    ),
  );
}
