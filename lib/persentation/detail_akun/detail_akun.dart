import '../index.dart';
import 'widget/box_bottom_detail_akun.dart';
import 'widget/box_top_detail_akun.dart';

class DetailAkun extends StatelessWidget {
  const DetailAkun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorApp.canvasColor,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.blue[900]!,
          title: Text(
            "Detail Akun",
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontFamily: "Poppin Semi Bold"),
          ),
        ),
        body: Column(
          children: const [
            ContainerAtas(),
            ContainerBawah(),
          ],
        ),
      ),
    );
  }
}
