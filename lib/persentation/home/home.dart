import '../index.dart';

import 'widget/menu_atas.dart';
import 'widget/menu_bawah.dart';

class HomeAdmin extends StatelessWidget {
  const HomeAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: false,
          title: Image.asset(
            "assets/images/logo_one.jpeg",
            fit: BoxFit.contain,
            width: 18.w,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Hi, Dimas",
                style: TextStyle(
                    color: Colors.blue[900]!,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppin Bold"),
              ),
            ),
            InkWell(
              onTap: () => Get.toNamed(Routes.detailAkun),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blue[600],
                  child: const CircleAvatar(
                    radius: 24,
                    backgroundImage:
                        AssetImage("assets/images/logo_github.png"),
                  ),
                ),
              ),
            )
          ],
        ),
        body: Stack(
          children: const [MenuAtas(), MenuBawah()],
        ),
      ),
    );
  }
}
