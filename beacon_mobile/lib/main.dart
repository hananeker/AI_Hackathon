import 'package:beacon/Bindings/initiale_binding.dart';
import 'package:beacon/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390.0, 828.0),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => GetMaterialApp(
              title: 'AppName',
              debugShowCheckedModeBanner: false,
              getPages: Routes.routes,
              initialRoute: Routes.initialRoute,
              initialBinding: InitialBinding(),
            ));
  }
}
