import 'package:eradah/app/routes/app_pages.dart';
import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:eradah/app/data/helper/AppTranslation.dart';
import 'package:eradah/app/data/component/CustemButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class IntroView extends GetView {
  var selectint = 0.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            head(),
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  selectint.value = value;
                },
                scrollDirection: Axis.horizontal,
                children: [
                  introScreen1(),
                  introScreen2(),
                  introScreen3(),
                ],
              ),
            ),
            foot(),
          ],
        ),
      ),
    );
  }

  Container head() {
    return Container(
      height: Get.height * .08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 80,
            height: 45,
            decoration: BoxDecoration(
              color: KprimaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: InkWell(
              onTap: () {
                Get.updateLocale(Locale('ar', 'EG'));
              },
              child: Center(
                child: Text(
                  'lang'.tr,
                  style: themeData.textTheme.headline2
                      .copyWith(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 40,
            height: 40,
            child: SvgPicture.asset('asset/images/logo.svg'),
          ),
          Container(
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.SigninView);
              },
              child: Text(
                'skip'.tr,
                style: themeData.textTheme.headline2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container introScreen1() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        child: Container(
          width: Get.width * .8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: KscandColor,
                blurRadius: 5,
                offset: Offset(1, 0),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'asset/images/intro1.svg',
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'TitleintroScreen1'.tr,
                  style: themeData.textTheme.headline1
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'DescriptionintroScreen1'.tr,
                  style: themeData.textTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container introScreen2() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        child: Container(
          width: Get.width * .8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: KscandColor,
                blurRadius: 5,
                offset: Offset(1, 0),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: SvgPicture.asset('asset/images/intro2.svg'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'TitleintroScreen2'.tr,
                    style: themeData.textTheme.headline1
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'DescriptionintroScreen2'.tr,
                    style: themeData.textTheme.subtitle1,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container introScreen3() {
    List<String> title = [
      'introScreen3Title1'.tr,
      'introScreen3Title2'.tr,
      'introScreen3Title3'.tr,
      'introScreen3Title4'.tr,
    ];

    List<String> subicon = [
      'asset/images/sub1.svg',
      'asset/images/sub2.svg',
      'asset/images/sub3.svg',
      'asset/images/sub4.svg',
    ];

    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        child: Container(
          width: Get.width * .8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: KscandColor,
                blurRadius: 5,
                offset: Offset(1, 0),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              child: Column(
                children: [
                  Text(
                    'TitleintroScreen3'.tr,
                    style: themeData.textTheme.headline2,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                        title.length,
                        (index) {
                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: Card(
                              color: Color(0xffEFEFEF),
                              elevation: 2,
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              margin: EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 10,
                              ),
                              child: ListTile(
                                leading:
                                    SvgPicture.asset(subicon.elementAt(index)),
                                title: Text(
                                  title.elementAt(index),
                                  style: themeData.textTheme.subtitle2
                                      .copyWith(fontSize: 14),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * .9,
                    child: CustemButton(
                      buttonText: 'StartNow'.tr,
                      onPressed: () {
                        Get.toNamed(Routes.SigninView);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Obx foot() {
    return Obx(() {
      return Container(
        height: Get.height * .08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selectint.value == 0 ? KprimaryColor : Colors.white,
                border: Border.all(
                  color: KprimaryColor,
                  width: 2,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selectint.value == 1 ? KprimaryColor : Colors.white,
                border: Border.all(
                  color: KprimaryColor,
                  width: 2,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selectint.value == 2 ? KprimaryColor : Colors.white,
                border: Border.all(
                  color: KprimaryColor,
                  width: 2,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
