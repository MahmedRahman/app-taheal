import 'package:eradah/app/data/component/CustomImageCached.dart';
import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:eradah/app/modules/levels/list/model/quetions_category_model.dart';
import 'package:eradah/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/levels_list_controller.dart';

class LevelsListView extends GetView<LevelsListController> {
  @override
  Widget build(BuildContext context) {
    LevelsListController controller = Get.put(LevelsListController());

    //<LevelsListController>();
    return Scaffold(
      body: ListView(
        children: [
          bulidSlider(),
          SizedBox(
            height: 10,
          ),
          FutureBuilder(
              future: controller.getLevels(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Datum> data = snapshot.data;

                  return Column(
                    children: List.generate(data.length, (index) {
                      Datum questionCategory = data.elementAt(index);
                      return Directionality(
                        textDirection: TextDirection.rtl,
                        child: ListTile(
                            onTap: () {
                              Get.toNamed(Routes.LEVELS_DETAIL, arguments: [
                                questionCategory.id,
                                questionCategory.details,
                                questionCategory.title
                              ]);
                            },
                            title: Text(
                              questionCategory.title,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: KprimaryColor,
                              ),
                            ),
                            subtitle: Text(
                              questionCategory.subTitle,
                              style: TextStyle(color: Color(0xffFFBC00)),
                            ),
                            trailing: CustomImageCached(
                                imageUrl: questionCategory.image)

                            // SvgPicture.asset(iconList.elementAt(index)),
                            ),
                      );
                    }),
                  );
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              })
        ],
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
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff7ED134)),
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