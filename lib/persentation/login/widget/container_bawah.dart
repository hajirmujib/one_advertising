import '../../index.dart';
import 'widget_textfiled_login.dart';

Widget containerBawah() {
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
          textFieldLogin(hintText: "Username"),
          textFieldLogin(
            hintText: "Password",
            obscureText: true,
            suffix: const Icon(
              Icons.remove_red_eye,
              color: Colors.grey,
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(
                Size(80.w, 100.h / 14),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () => Get.offAndToNamed(Routes.homeAdmin),
            child: Text(
              "Login",
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.blue[700],
                  fontWeight: FontWeight.w700),
            ),
          ).marginOnly(top: 40),
        ],
      ),
    ),
  );
}
