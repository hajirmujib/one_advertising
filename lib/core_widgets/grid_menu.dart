import 'package:flutter/material.dart';
import 'package:one_advertising/config/color.dart';

import 'package:sizer/sizer.dart';

class GridMenu extends StatelessWidget {
  const GridMenu({Key? key, this.title, this.ikon}) : super(key: key);
  final String? title;
  final IconData? ikon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1.h),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
              blurRadius: 1.5,
              offset: Offset(0.9, 0.2),
              color: ColorApp.shadowcolor,
              spreadRadius: 1.3)
        ],
        color: Colors.white,
      ),
      height: 100,
      alignment: const Alignment(0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            ikon,
            color: Colors.blue[900]!,
            size: 5.h,
          ),
          Text(
            title.toString(),
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.blue[900]!,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                fontFamily: "Poppin Semi Bold"),
          ),
        ],
      ),
    );
  }
}
