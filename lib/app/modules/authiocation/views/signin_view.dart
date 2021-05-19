import 'package:eradah/app/data/helper/AppValidation.dart';
import 'package:eradah/app/modules/authiocation/controllers/authiocation_controller.dart';
import 'package:eradah/app/routes/app_pages.dart';
import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:eradah/app/data/component/CustemButton.dart';
import 'package:eradah/app/data/component/CustemCheckbox.dart';
import 'package:eradah/app/data/component/CustomTextFormFiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SigninView extends GetView<AuthiocationController> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                AuthiocationHeader(
                  title: 'اهلا بك',
                  subTitle: 'أنشى حساب أو سجل الدخول للمتابعة',
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
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
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Register with'.tr,
                                  style: headline2,
                                ),
                                SizedBox(
                                  height: 20,
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
                                    return AppValidation.validatePassword(
                                        value);
                                  },
                                ),
                                Row(
                                  textDirection: TextDirection.rtl,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustemCheckbox(
                                      checkboxText: 'تذكرنى',
                                      onChanged: (value) {},
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Get.toNamed(Routes.ForgetpasswordView);
                                      },
                                      child: Text(
                                        'forget your password'.tr,
                                        style: TextStyle(
                                          color: KprimaryColor,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: Get.width * .9,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: CustemButton(
                            buttonText: 'sigin'.tr,
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                // Get.toNamed(Routes.HOME);
                                controller.signInWithEmailAndPassword();
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: Get.width * .9,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.SignupView);
                    },
                    child: Text(
                      'Register a new account'.tr,
                      style: TextStyle(
                        color: KprimaryColor,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AuthiocationHeader extends StatelessWidget {
  final String title;
  final String subTitle;

  const AuthiocationHeader({
    Key key,
    this.title,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: KprimaryColor,
        borderRadius: borderRadius,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: SvgPicture.asset(
              'asset/images/signin.svg',
              width: 80,
            ),
          ),
          Text(
            'Dr.Kids Taheal',
            style: headline3,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'cairo'
                //  fontSize:
                ),
          ),
          Text(
            subTitle,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'cairo'),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
