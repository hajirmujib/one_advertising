import 'package:one_advertising/controller/user_c.dart';
import 'package:one_advertising/model/user_model.dart';

import '../../index.dart';

class ContainerBawah extends StatelessWidget {
  const ContainerBawah({
    required this.data,
    Key? key,
  }) : super(key: key);
  final UserM data;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserController>();

    return Container(
      padding: const EdgeInsets.all(15.0),
      width: 100.w,
      height: 60.h,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nama",
                      style: TextStyle(
                          color: ColorApp.blackFont,
                          fontSize: 12.sp,
                          fontFamily: "Poppin Medium"),
                    ),
                    Text(
                      data.nama.toString(),
                      style: TextStyle(
                          color: ColorApp.blackFont,
                          fontSize: 13.sp,
                          fontFamily: "Poppin Semi Bold"),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    controller.edit(data: "nama");
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: ColorApp.blackFont,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: ColorApp.blackFont,
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                          color: ColorApp.blackFont,
                          fontSize: 12.sp,
                          fontFamily: "Poppin Medium"),
                    ),
                    Text(
                      data.email.toString(),
                      style: TextStyle(
                          color: ColorApp.blackFont,
                          fontSize: 13.sp,
                          fontFamily: "Poppin Semi Bold"),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    controller.edit(data: "email");
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: ColorApp.blackFont,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: ColorApp.blackFont,
          ),
          // Padding(
          //   padding: EdgeInsets.only(top: 1.h),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             "Level",
          //             style: TextStyle(
          //                 color: ColorApp.blackFont,
          //                 fontSize: 13.sp,
          //                 fontFamily: "Poppin Medium"),
          //           ),
          //           Text(
          //             data.level.toString(),
          //             style: TextStyle(
          //                 color: ColorApp.blackFont,
          //                 fontSize: 12.sp,
          //                 fontFamily: "Poppin Semi Bold"),
          //           ),
          //         ],
          //       ),
          //       // IconButton(
          //       //   onPressed: () {
          //       //     controller.edit(data: "level");
          //       //   },
          //       //   icon: const Icon(
          //       //     Icons.edit,
          //       //     color: ColorApp.blackFont,
          //       //   ),
          //       // ),
          //     ],
          //   ),
          // ),
          // const Divider(
          //   color: ColorApp.blackFont,
          // ),
          Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(
                          color: ColorApp.blackFont,
                          fontSize: 12.sp,
                          fontFamily: "Poppin Medium"),
                    ),
                    Text(
                      "******",
                      style: TextStyle(
                          color: ColorApp.blackFont,
                          fontSize: 13.sp,
                          fontFamily: "Poppin Semi Bold"),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    controller.edit(data: "password");
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: ColorApp.blackFont,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: ColorApp.blackFont,
          ),
        ],
      ),
    );
  }
}
