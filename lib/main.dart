import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:local_storage/app/modules/home/bindings/home_binding.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: HomeBinding(),
    ),
  );
}
