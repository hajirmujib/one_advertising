import '../../index.dart';

class ContainerBawah extends StatelessWidget {
  const ContainerBawah({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      "Dimas Tri Yolanda",
                      style: TextStyle(
                          color: ColorApp.blackFont,
                          fontSize: 13.sp,
                          fontFamily: "Poppin Semi Bold"),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
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
                      "Dimas@gmail.com",
                      style: TextStyle(
                          color: ColorApp.blackFont,
                          fontSize: 13.sp,
                          fontFamily: "Poppin Semi Bold"),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
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
                      "Level",
                      style: TextStyle(
                          color: ColorApp.blackFont,
                          fontSize: 13.sp,
                          fontFamily: "Poppin Medium"),
                    ),
                    Text(
                      "Admin",
                      style: TextStyle(
                          color: ColorApp.blackFont,
                          fontSize: 12.sp,
                          fontFamily: "Poppin Semi Bold"),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
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
                  onPressed: () {},
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
