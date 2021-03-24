import 'package:eradah/app/data/helper/AppConstant.dart';
import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:eradah/app/data/helper/AppTranslation.dart';
import 'package:eradah/app/modules/authiocation/bindings/authiocation_binding.dart';
import 'package:eradah/app/modules/authiocation/controllers/authiocation_controller.dart';
import 'package:eradah/app/modules/authiocation/provider/authiocation_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';


void main() {
  
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



/*
void main() {
  AuthenticationProvider().prepareList();


}

*/