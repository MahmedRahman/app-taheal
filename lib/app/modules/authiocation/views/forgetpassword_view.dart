import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:eradah/app/modules/authiocation/views/signin_view.dart';
import 'package:eradah/app/data/helper/AppConstant.dart';
import 'package:eradah/app/routes/app_pages.dart';
import 'package:eradah/app/data/component/CustemButton.dart';
import 'package:eradah/app/data/component/CustomTextFormFiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetpasswordView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AuthiocationHeader(
              title: 'اهلا بك',
              subTitle: 'استعادة حسابك',
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.all(20),
                    child: Text(
                      'نحتاج فقط إلى عنوان بريدك الإلكتروني المسجل لنرسل لك بقية كلمة المرور',
                      style: headline2.copyWith(color: KprimaryColor,fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: Get.width*.9,
                    child: CustomTextFormFiled(
                      inputLabel: 'email'.tr,
                      inputHit: 'أدخل البريد الإلكتروني الخاص بك'.tr,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: Get.width*.9,
                    child: CustemButton(
                      buttonText:'إعادة تعيين كلمة المرور',
                      onPressed: (){
                        Get.toNamed(Routes.SigninView);
                      },
                    ),
                  ),
              
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
