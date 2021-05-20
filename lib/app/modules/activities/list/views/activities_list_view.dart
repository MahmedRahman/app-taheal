import 'package:eradah/app/data/helper/AppConstant.dart';
import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:eradah/app/modules/activities/list/model/ActivatyModel.dart';
import 'package:eradah/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:eradah/app/modules/activities/model/vedio_model.dart';

import '../controllers/activities_list_controller.dart';

class ActivitiesListView extends GetView<ActivitiesListController> {
  @override
  Widget build(BuildContext context) {
    ActivitiesListController controller = Get.put(ActivitiesListController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            bulidSlider(),
            Obx(() {
              return FutureBuilder(
                future: controller.categoriesList.value,
                builder: (index, snapshot) {
                  if (snapshot.hasData) {
                    // List<Datum> data = snapshot.data;
                    ActivatyModel activatyModel = snapshot.data;
                    return Column(
                      children:
                          List.generate(activatyModel.data.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 5,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(HexColorFormString().getColorFromHex(
                                  activatyModel.data.elementAt(index).color)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            height: 90,
                            child: Center(
                              child: ListTile(
                                  onTap: () {
                                    print('object');

                                    Get.toNamed(Routes.ACTIVITIES_DETAIL,
                                        arguments: activatyModel.data
                                            .elementAt(index)
                                            .id
                                            .toString());
                                  },
                                  title: Text(
                                    '${activatyModel.data.elementAt(index).title}',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  leading: Image.network(
                                      activatyModel.data.elementAt(index).img)
                                  //Image.network(data.elementAt(index).img)
                                  //SvgPicture.network(data.elementAt(index).img),
                                  ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            }),
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
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'تؤثر التجارب و الخبرات الحركية المبكرة لطفلك على تطورات بنية الجهاز العصبي و العضلي و الهيكلي',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      return Text(
                        'حافظ على تقدم ${KuserName.value} حتى الآن اضغط على أي مهارة لتحديث المستويات',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      );
                    }),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      child: Text('اشترك الان'),
                      onPressed: () {
                        Get.toNamed(Routes.SUBSCRIPTION);
                      },
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

class HexColorFormString {
  int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 3) {
      hexColor = "FF" + hexColor + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
