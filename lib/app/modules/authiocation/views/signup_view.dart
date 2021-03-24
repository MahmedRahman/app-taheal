import 'package:eradah/app/data/helper/AppConstant.dart';
import 'package:eradah/app/data/helper/AppUtils.dart';
import 'package:eradah/app/data/helper/AppValidation.dart';
import 'package:eradah/app/modules/authiocation/controllers/authiocation_controller.dart';
import 'package:eradah/app/modules/authiocation/views/signin_view.dart';
import 'package:eradah/app/routes/app_pages.dart';
import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:eradah/app/data/component/CustemCheckbox.dart';
import 'package:eradah/app/data/component/CustomTextFormFiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignupView extends GetView<AuthiocationController> {
  bool confirmStatus = false;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              AuthiocationHeader(
                title: 'اهلا بك فى ',
                subTitle: 'أنشى حساب جديد',
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 25,
                  ),
                  child: Container(
                    width: Get.width * .9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      border: Border.all(
                        color: KprimaryColor,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  'التسجيل بواسطة',
                                  style: headline2,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    child: SvgPicture.asset(
                                      'asset/images/googel.svg',
                                      width: 32,
                                      height: 32,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  SvgPicture.asset(
                                    'asset/images/facebook.svg',
                                    width: 32,
                                    height: 32,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  SvgPicture.asset(
                                    'asset/images/apple.svg',
                                    width: 32,
                                    height: 32,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'or'.tr,
                                style: headline2,
                              ),
                              CustomTextFormFiled(
                                inputLabel: 'email'.tr,
                                inputHit: 'email'.tr,
                                inputController: controller.email,
                                keyboardType: TextInputType.emailAddress,
                                onValidator: (value) {
                                  return AppValidation.checkEmail(value);
                                },
                              ),
                              CustomTextFormFiled(
                                inputLabel: 'password'.tr,
                                inputHit: 'password'.tr,
                                inputController: controller.password,
                                keyboardType: TextInputType.visiblePassword,
                                onValidator: (value) {
                                  return AppValidation.validatePassword(value);
                                },
                              ),
                              CustemCheckbox(
                                checkboxText: 'أنا موافق مع سياسية الاستخدام',
                                onChanged: (value) {
                                  confirmStatus = value;
                                  print(confirmStatus);
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: Get.width * .9,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(KprimaryColor),
                    ),
                    onPressed: () {
                      print(confirmStatus);
                      if (_formKey.currentState.validate()) {
                        if (confirmStatus) {
                          Get.toNamed(Routes.ProfileUserView);
                        } else {
                          AppUtils().showSnackBar(
                              title: appName,
                              message: 'يجب الموافقة على سياسية الاستخدام',
                              snackbarStatus: () {
                                
                              });
                        }
                      }
                      //
                    },
                    child: Text(
                      'Next'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
