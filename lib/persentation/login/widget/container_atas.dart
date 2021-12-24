import '../../index.dart';

class ContainerAtasLogin extends StatelessWidget {
  const ContainerAtasLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      width: 100.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Hello, Wellcome Back",
            style: TextStyle(
                color: Colors.blue[800],
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                fontFamily: "Poppin Semi Bold"),
          ),
          Image.asset(
            "assets/images/logo_one.jpeg",
            fit: BoxFit.contain,
            width: 35.w,
          )
        ],
      ),
    );
  }
}
