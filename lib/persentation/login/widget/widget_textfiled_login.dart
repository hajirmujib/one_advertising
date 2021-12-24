import '../../index.dart';

Widget textFieldLogin(
    {Widget? suffix, String? hintText, bool obscureText = false}) {
  return Container(
    margin: const EdgeInsets.only(top: 20),
    width: 80.w,
    height: 8.h,
    // color: Colors.white,
    child: Center(
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          // suffix: Icon(Icons.home),
          suffixIcon: suffix,
          hintText: hintText,
        ),
      ),
    ),
  );
}
