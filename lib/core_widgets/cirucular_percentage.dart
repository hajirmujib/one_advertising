import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';

class CircullarPercent extends StatelessWidget {
  const CircullarPercent({this.number, this.title, Key? key}) : super(key: key);
  final String? number;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularPercentIndicator(
        backgroundColor: Colors.blue[900]!,
        startAngle: 200.0,
        radius: 10.h,
        lineWidth: 5.0,
        percent: 0.9,
        progressColor: Colors.lime[400],
        center: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              number.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppin Bold"),
            ),
          ),
        ),
        footer: Text(
          title.toString(),
          style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppin Medium"),
        ),
      ),
    );
  }
}
