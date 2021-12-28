import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_advertising/routes/app_pages.dart';
import 'package:sizer/sizer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    Sizer(builder: (context, orientation, deviceType) {
      return RefreshConfiguration(
        headerBuilder: () =>
            const WaterDropHeader(), //? Configure the default header indicator. If you have the same header indicator for each page, you need to set this
        headerTriggerDistance: 80.0, //? header trigger refresh trigger distance
        child: GetMaterialApp(
          title: 'One Advertising',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: AppPages.initialPage,
          getPages: AppPages.routes,
        ),
      );
    }),
  );
}
