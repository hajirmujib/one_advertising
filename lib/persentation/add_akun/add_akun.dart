import 'dart:io';

import '../../controller/user_c.dart';
import '../detail_akun/widget/box_bottom_detail_akun.dart';
import '../detail_akun/widget/box_top_detail_akun.dart';
import '../index.dart';

class AddAkun extends GetView<UserController> {
  const AddAkun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarApp(
        appBar: AppBar(),
        title: "Tambah Akun", //?judul
      ),
      body: ListView(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(50)),
          )
        ],
      ),
    );
  }
}
