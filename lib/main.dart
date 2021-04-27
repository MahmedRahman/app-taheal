import 'package:eradah/app/data/helper/AppConstant.dart';
import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:eradah/app/data/helper/AppTranslation.dart';
import 'package:eradah/app/modules/authiocation/bindings/authiocation_binding.dart';
import 'package:eradah/app/modules/authiocation/controllers/authiocation_controller.dart';
import 'package:eradah/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  
  await GetStorage.init();
  await initServices();
  runApp(
    GetMaterialApp(
      theme: themeData,
      title: appName,
      initialRoute: AppPages.INITIAL,
      defaultTransition: Transition.fade,
      getPages: AppPages.routes,
      locale: Locale('ar', 'EG'),
      fallbackLocale: Locale('ar', 'EG'),
      translations: AppTranslation(),
      textDirection: TextDirection.ltr,
      initialBinding: AuthiocationBinding(),
    ),
  );
}

initServices() async {
  await Get.putAsync<UserAuth>(() async => await UserAuth());
}

/*
void main() {
  AuthenticationProvider().prepareList();


}

*/