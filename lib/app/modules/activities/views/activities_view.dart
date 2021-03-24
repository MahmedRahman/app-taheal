import 'package:eradah/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:eradah/app/modules/activities/controllers/activities_controller.dart';
import 'package:lottie/lottie.dart';

class ActivitiesView extends GetView<ActivitiesController> {
  List<String> imageList = [
    'asset/activities/01.svg',
    'asset/activities/02.svg',
    'asset/activities/03.svg',
    'asset/activities/04.svg',
    'asset/activities/05.svg',
    'asset/activities/06.svg',
    'asset/activities/07.svg',
  ];

  List<String> titleList = [
    'مساعدة الطفل على رفع راسه و التحكم بها',
    'تشجيع الإستدارة و الإلتواء',
    'المساعدة على الإمساك بالأشياء و الوصول اليها و التنسيق بين اليد و العين',
    'الزحف و الحبو',
    'التحكم بالجذع و التوازن و الجلوس',
    'التحكم في الحوض و الوقوف',
    'المشي و التوازن',
  ];

  List<Color> colorList = [
    Color(0XFF0DB7C5),
    Color(0xFFD60B51),
    Color(0XFFD4B100),
    Color(0xFF00B52A),
    Color(0XFF699799),
    Color(0xFFD60B51),
    Color(0xFF00B52A),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            bulidSlider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                  children: List.generate(7, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 5,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorList.elementAt(index),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 90,
                    child: Center(
                      child: ListTile(
                        onTap: () {
                          Get.toNamed(Routes.ActivitesListVideoView);
                        },
                        title: Text(
                          titleList.elementAt(index),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: SvgPicture.asset(imageList.elementAt(index)),
                      ),
                    ),
                  ),
                );
              }).toList()),
            )
          ],
        ),
      ),
    );
  }
}

Container bulidSlider() {
  return Container(
    height: Get.height * .3,
    width: Get.width,
    decoration: BoxDecoration(
      color: Color(0xffD60B6A),
    ),
    child: Stack(
      children: [
        Positioned(
          right: 1,
          child: Container(
            child: SvgPicture.asset('asset/images/slideimg.svg'),
          ),
        ),
        Positioned(
          left: 1,
          top: 1,
          bottom: 1,
          child: Container(
            child: SvgPicture.asset('asset/images/slide2.svg'),
          ),
        ),
        Row(
          children: [
            Container(
              width: Get.width * .1,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                width: Get.width * .8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'اختر المهارات المناسبة لمعاذ لتتأكد من طرق التحسين',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'حافظ على تقدم معاذ حتى الآن اضغط على أي مهارة لتحديث المستويات',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      child: Text('اشترك الان'),
                      onPressed: () {},
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xff7ED134)),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: Get.width * .1,
            ),
          ],
        ),
      ],
    ),
  );
}
