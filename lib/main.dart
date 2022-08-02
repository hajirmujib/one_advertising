import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_advertising/routes/app_pages.dart';
import 'package:sizer/sizer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'config/color.dart';
import 'controller/auth_c.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    Sizer(builder: (context, orientation, deviceType) {
      final authC = Get.put(AuthC());
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
          // initialRoute: AppPages.initialPage,
          home: FutureBuilder(
              future: authC.goto(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        color: ColorApp.primaryColor,
                      ),
                    ),
                  );
                }

                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Error :("),
                  );
                }
                if (snapshot.data == null) {
                  return const Center(
                    child: Text("Null :("),
                  );
                }
                return snapshot.data;
              }),
          getPages: AppPages.routes,
        ),
      );
    }),
  );
}
