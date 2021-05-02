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
    PlanListController controller = Get.put(PlanListController());
controller.getPlan();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight( 50),
          child: Container(
            color: KprimaryColor,
            child: Column(
              children: [
               // bulidSlider(),(Get.height * .3)+
                TabBar(
                  tabs: [
                    Tab(
                      text: 'الانشطة الحالية',
                    ),
                    Tab(
                      text: 'الانشطة السابقة',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            listVideo(0),
            listVideo(1),
          ],
        ),
      ),
    );
  }
}

class listVideo extends GetView<PlanListController> {
  listVideo(this.listtype);
  int listtype;

  @override
  Widget build(BuildContext context) {

    return GetX(
        init: PlanListController(),
        builder: (controller) {
          return FutureBuilder(
            future: listtype == 1 ? controller.VedioComplateListFutter.value :controller.VedioNotComplateListFutter.value  ,
            builder: (context, snapshot) {



             
              if (snapshot.hasData) {

                
                 List<MyVedio> videolist = snapshot.data;
                return ListView(
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
                              MaterialPageRoute(
                                builder: (context) => PlanDetailView(myVedio),
                              ),
                            );
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
                                    myVedio.title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: KprimaryColor,
                                    ),
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
                                        color: Colors.grey.withOpacity(.4),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.play_circle_fill,
                                          color: Colors.white,
                                          size: 64,
                                        ),
                                      ),
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
                                      snackbarStatus: () {
                                        controller.setCommplate(
                                            vedioid: myVedio.id, omplate: 1);
                                      },
                                    );
                                  },
                                  label: Text(
                                    'وضع علامة على النشاط على أنه مكتمل',
                                  ),
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
                                            title: myVedio.title,
                                            titleStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: KprimaryColor,
                                              fontFamily: 'cairo',
                                              fontSize: 20,
                                            ),
                                            content: Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: SizedBox(
                                                height: 200,
                                                child: SingleChildScrollView(
                                                  child: Html(
                                                    data: myVedio.details,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
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
                                                    fontWeight: FontWeight.bold,
                                                  ),
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
                                                          snackbarStatus: () {
                                                            controller.setRate(
                                                                vedioid:
                                                                    myVedio.id,
                                                                rate: 0);
                                                          },
                                                        );
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(15),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child:
                                                              SvgPicture.asset(
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
                                                          snackbarStatus: () {
                                                            controller.setRate(
                                                                vedioid:
                                                                    myVedio.id,
                                                                rate: 1);
                                                          },
                                                        );
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(15),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child:
                                                              SvgPicture.asset(
                                                            'asset/images/dislike.svg',
                                                            width: 64,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
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
                );
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        });
  }
}

