import '../index.dart';
import 'widgets/card_akun.dart';

class DaftarAkun extends StatelessWidget {
  const DaftarAkun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorApp.canvasColor,
        appBar: AppbarApp(
          appBar: AppBar(),
          title: "Daftar Akun",
        ),
        body: ListView(
          children: [
            InkWell(
              onTap: () => Get.toNamed(Routes.detailAkun),
              child: cardAkun(
                  image: "assets/images/logo_github.png",
                  nama: "Dimas Tri Yolanda",
                  level: "Admin"),
            ),
            cardAkun(
                image: "assets/images/logo_github.png",
                nama: "Dimas Tri Yolanda",
                level: "Admin"),
          ],
        ),
      ),
    );
  }
}
