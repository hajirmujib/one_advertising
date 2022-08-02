import 'package:one_advertising/controller/user_c.dart';
import 'package:one_advertising/model/user_model.dart';
import 'package:one_advertising/services/services.dart';

import '../index.dart';

import 'widget/menu_atas.dart';
import 'widget/menu_bawah.dart';

class HomeAdmin extends StatelessWidget {
  const HomeAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return SafeArea(
      child: Obx(
        () => controller.viewState.value == ViewState.busy
            ? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                // appBar: AppBar(
                //   automaticallyImplyLeading: false,
                //   backgroundColor: Colors.white,
                //   elevation: 0.0,
                //   centerTitle: false,
                //   title: Image.asset(
                //     "assets/images/logo_one2.jpeg",
                //     fit: BoxFit.contain,
                //     width: 18.w,
                //   ),
                //   actions: [
                //     Row(
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.all(15.0),
                //           child: Text(
                //             "Hi, " + controller.profile.nama.toString(),
                //             style: TextStyle(
                //                 color: Colors.blue[900]!,
                //                 fontSize: 12.sp,
                //                 fontWeight: FontWeight.w500,
                //                 fontFamily: "Poppin Bold"),
                //           ),
                //         ),
                //         InkWell(
                //           onTap: () {
                //             controller.idTemp.value =
                //                 controller.profile.idAkun.toString();
                //             controller.getDetailUser();
                //             Get.toNamed(Routes.detailAkun);
                //           },
                //           child: Padding(
                //             padding: const EdgeInsets.all(5.0),
                //             child: CircleAvatar(
                //               radius: 25,
                //               backgroundColor: Colors.blue[600],
                //               child: CircleAvatar(
                //                 radius: 24,
                //                 backgroundImage: NetworkImage(urlImage +
                //                     controller.profile.foto.toString()),
                //                 onBackgroundImageError:
                //                     (exception, stackTrace) =>
                //                         const Icon(Icons.error),
                //               ),
                //             ),
                //           ),
                //         )
                //       ],
                //     ),
                //   ],
                // ),
                body: Stack(
                  children: const [MenuAtas(), MenuBawah()],
                ),
              ),
      ),
    );
  }
}
