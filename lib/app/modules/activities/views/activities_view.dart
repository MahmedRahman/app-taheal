import 'package:eradah/app/modules/activities/model/vedio_model.dart';
import 'package:eradah/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:eradah/app/modules/activities/controllers/activities_controller.dart';
import 'package:lottie/lottie.dart';

class ActivitiesView extends GetView<ActivitiesController> {

ActivitiesController controller = Get.put(ActivitiesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            bulidSlider(),
            FutureBuilder(
              future: controller.allCategories(),
              builder: (index, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        '${snapshot.error} occured',
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    // Extracting data from snapshot object
                    List<Datum> data = snapshot.data;
                    return Column(
                      children: List.generate(data.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 5,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            height: 90,
                            child: Center(
                              child: ListTile(
                                  onTap: () {
                                    Get.toNamed(Routes.ActivitesListVideoView);
                                  },
                                  title: Text(
                                    data.elementAt(index).title,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  leading:
                                      Image.network(data.elementAt(index).img)
                                  //SvgPicture.network(data.elementAt(index).img),
                                  ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
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
                      onPressed: () {
                        print('object');
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
