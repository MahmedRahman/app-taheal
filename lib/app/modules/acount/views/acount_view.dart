import 'package:eradah/app/routes/app_pages.dart';
import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:eradah/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:eradah/app/modules/acount/controllers/acount_controller.dart';

class AcountView extends GetView<AcountController> {
  List<String> Listimage = [
    'asset/account/01.svg',
    'asset/account/02.svg',
    'asset/account/03.svg',
    'asset/account/04.svg',
    'asset/account/05.svg',
    'asset/account/06.svg',
  ];

  List<String> Listlabel = [
    'تعديل الحساب',
    'مركز المساعدة',
    'حول ارادة',
    'الاشعارات',
    'اللغة',
    'تسجيل الخروج'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Container(
            child: Center(
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Center(
                          child: SvgPicture.asset('asset/images/logo.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                text: '',
                                children: [
                                  TextSpan(
                                      text: 'D',
                                      style: themeData.textTheme.headline6),
                                  TextSpan(
                                      text: 'r',
                                      style: themeData.textTheme.headline6),
                                  TextSpan(
                                    text: '.',
                                    style: themeData.textTheme.headline6
                                        .copyWith(color: Colors.black),
                                  ),
                                  TextSpan(
                                      text: 'Kids',
                                      style: themeData.textTheme.headline6),
                                  TextSpan(text: ' '),
                                  TextSpan(
                                    text: 'Taheal',
                                    style: themeData.textTheme.headline6
                                        .copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Text(
                          Get.find<UserAuth>().getUserName(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(Get.find<UserAuth>().getUserEmail())
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    children: List.generate(6, (index) {
                      return Directionality(
                        textDirection: TextDirection.rtl,
                        child: ListTile(
                          onTap: () {
                            Get.find<UserAuth>().setUserToken(null);

                            Get.toNamed(Routes.SigninView);
                          },
                          title: Text(
                            Listlabel.elementAt(index),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                          leading: SvgPicture.asset(Listimage.elementAt(index)),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: KprimaryColor,
                          ),
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
