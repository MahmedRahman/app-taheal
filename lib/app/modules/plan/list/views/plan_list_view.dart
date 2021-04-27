import 'package:eradah/app/data/component/CustomImageCached.dart';
import 'package:eradah/app/data/helper/AppConstant.dart';
import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:eradah/app/data/helper/showSnackBar.dart';
import 'package:eradah/app/modules/activities/views/activities_view.dart';
import 'package:eradah/app/modules/plan/detail/views/plan_detail_view.dart';

import 'package:eradah/app/modules/plan/model/plan_video_model.dart';
import 'package:eradah/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/plan_list_controller.dart';

class PlanListView extends GetView<PlanListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            bulidSlider(),
            DefaultTabController(
              initialIndex: 0,
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.green,
                    tabs: [
                      Tab(
                        child: Text("الأنشطة الحالية"),
                      ),
                      Tab(
                        child: Text("الأنشطة السابقة"),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            listVideo(),
          ],
        ),
      ),
    );
  }
}

class listVideo extends GetView<PlanListController> {
  const listVideo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlanListController controller = Get.put(PlanListController());
    return FutureBuilder(
        future: controller.getPlan(),
        builder: (context, snapshot) {
          List<MyVedio> videolist = snapshot.data;

          if (snapshot.hasData) {
            return Column(
              children: [
                Column(
                  children: List.generate(
                    videolist.length,
                    (index) {
                      MyVedio myVedio = videolist.elementAt(index);

                      return Card(
                        elevation: 2,
                        margin: EdgeInsets.all(15),
                        child: InkWell(
                          onTap: () {

                            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PlanDetailView(myVedio)),
  );

                            //Get.to(PlanDetailView(myVedio));
                            //
                          },
                          child: Column(
                            children: [
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: ListTile(
                                  leading: Container(
                                    height: Get.height,
                                    child: SizedBox(
                                      width: 32,
                                      height: 32,
                                      child: SvgPicture.asset(
                                        'asset/images/sign.svg',
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    myVedio.catTitle,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: KprimaryColor),
                                  ),
                                  subtitle: Text(
                                    myVedio.descCat,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                              Stack(
                                children: [
                                  CustomImageCached(
                                    imageUrl: myVedio.img,
                                  ),
                                  Positioned.fill(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(.4)),
                                      child: Center(
                                          child: Icon(
                                        Icons.play_circle_fill,
                                        color: Colors.white,
                                        size: 64,
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      primary: KprimaryColor),
                                  onPressed: () {
                                    showSnackBar(
                                      title: appName,
                                      message:
                                          'تم الانتهاء من عمل النشاط اللزم وسيتنقل الى الانشطة السابقة',
                                      snackbarStatus: () {},
                                    );
                                  },
                                  label: Text(
                                      'وضع علامة على النشاط على أنه مكتمل'),
                                  icon: Icon(Icons.done_all),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                            primary: KprimaryColor),
                                        onPressed: () {
                                          Get.defaultDialog(
                                              title: 'التجارب المبكرة',
                                              titleStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: KprimaryColor,
                                                fontFamily: 'cairo',
                                                fontSize: 20,
                                              ),
                                              content: Container(
                                                child: SizedBox(
                                                  height: Get.height * .5,
                                                  child: Column(
                                                    children: [
                                                      Html(
                                                        data: myVedio.details,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ));
                                        },
                                        label: Text('الوصف'),
                                        icon: Icon(Icons.read_more),
                                      ),
                                    ),
                                    Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                            primary: KprimaryColor),
                                        onPressed: () {
                                          Get.defaultDialog(
                                              title:
                                                  'ساعدنا في وضع خطة أفضل لك ولطفلك',
                                              titleStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: KprimaryColor,
                                                fontFamily: 'cairo',
                                                fontSize: 14,
                                              ),
                                              content: Column(
                                                children: [
                                                  Text(
                                                    'هل استمتع طفلك بهذا النشاط',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          Get.back();
                                                          showSnackBar(
                                                            title: appName,
                                                            message:
                                                                'تم تقيم الفيديو',
                                                            snackbarStatus:
                                                                () {},
                                                          );
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: SvgPicture
                                                                .asset(
                                                              'asset/images/like.svg',
                                                              width: 64,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          Get.back();
                                                          showSnackBar(
                                                            title: appName,
                                                            message:
                                                                'تم تقيم الفيديو',
                                                            snackbarStatus:
                                                                () {},
                                                          );
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: SvgPicture
                                                                .asset(
                                                              'asset/images/dislike.svg',
                                                              width: 64,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ));
                                        },
                                        label: Text('تقييم'),
                                        icon: Icon(Icons.rate_review),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }

          return Container(
            child: Text('data'),
          );
        });
  }
}
