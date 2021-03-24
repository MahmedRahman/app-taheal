import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:eradah/app/modules/levels/controllers/levels_controller.dart';

class LevelsView extends GetView<LevelsController> {
  List<String> iconList = [
    'asset/leval/01.svg',
    'asset/leval/02.svg',
    'asset/leval/03.svg',
    'asset/leval/04.svg',
    'asset/leval/05.svg',
    'asset/leval/06.svg',
  ];

  List<String> title = [
    'التحكم في الرأس',
    'الحبو و الزحف',
    'التقليب',
    'الوقوف',
    'المشي',
    'الجلوس',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            bulidSlider(),
            Text(
              'حافظ على تقدم معاذ حتى الآن',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: KprimaryColor,
                fontSize: 18,
              ),
            ),
            Text(
              'اضغط على أي مهارة لتحديث المستويات',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: List.generate(5, (index) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          title.elementAt(index),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: KprimaryColor,
                          ),
                        ),
                        subtitle: Text(
                          'اعتمد التقييم',
                          style: TextStyle(color: Color(0xffFFBC00)),
                        ),
                        trailing: SvgPicture.asset(iconList.elementAt(index)),
                      ),
                      Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
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
                        style: ElevatedButton.styleFrom(primary: Color(0xff7ED134)),
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
}
