import 'package:eradah/app/data/component/CustomImageCached.dart';
import 'package:eradah/app/data/helper/AppConstant.dart';
import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:eradah/app/data/helper/showSnackBar.dart';
import 'package:eradah/app/modules/activities/list/views/activities_list_view.dart';
import 'package:eradah/app/modules/plan/detail/views/plan_detail_view.dart';

import 'package:eradah/app/modules/plan/model/plan_video_model.dart';
import 'package:eradah/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/plan_list_controller.dart';

class PlanListView extends GetView<PlanListController> {
  var isSelect = true.obs;

  @override
  Widget build(BuildContext context) {
    PlanListController controller = Get.put(PlanListController());

    return ListView(
      children: [
        InkWell(
          onTap: (){
            Get.toNamed(Routes.SUBSCRIPTION);
          },
          child: Image.asset('asset/images/baner.png'),
        ),
        Obx(() {
          return Row(
            children: [
              Expanded(
                child: Container(
                  color: isSelect.value ? KprimaryColor : Colors.white,
                  child: TextButton(
                    onPressed: () {
                      isSelect.value = true;
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset('asset/images/calendar1.svg'),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'الانشطة الحالية',
                          style: TextStyle(
                            color:
                                isSelect.value ? Colors.white : KprimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: isSelect.value ? Colors.white : KprimaryColor,
                  child: TextButton(
                    onPressed: () {
                      isSelect.value = false;
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset('asset/images/calendar2.svg'),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'الانشطة السابقة',
                          style: TextStyle(
                            color:
                                isSelect.value ? KprimaryColor : Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
        Obx(() {
          return isSelect.value ? listVideo(0) : listVideo(1);
        }),
      ],
    );
  }
}

class listVideo extends GetView<PlanListController> {
  listVideo(this.listtype);
  int listtype;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return FutureBuilder(
          future: listtype == 1
              ? controller.VedioComplateListFutter.value
              : controller.VedioNotComplateListFutter.value,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<MyVedio> videolist = snapshot.data;

              return ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(
                  videolist.length,
                  (index) {
                    MyVedio myVedio = videolist.elementAt(index);
                    return cardPlanItem(context, myVedio, controller);
                  },
                ),
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }

  Card cardPlanItem(BuildContext context, MyVedio myVedio, controller) {
    Widget IconRate = SvgPicture.asset(
      'asset/images/dislike.svg',
      width: 64,
    );

    if (myVedio.rate.toString() == '0') {
      IconRate = SvgPicture.asset(
        'asset/images/dislike.svg',
        width: 64,
      );
    } else if (myVedio.rate.toString() == '1') {
      IconRate = SvgPicture.asset(
        'asset/images/like.svg',
        width: 64,
      );
    } else {
      IconRate = InkWell(
        onTap: () {
          Get.defaultDialog(
            title: 'ساعدنا في وضع خطة أفضل لك ولطفلك',
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                        controller.setRate(
                          vedioid: myVedio.id,
                          rate: 1,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            'asset/images/like.svg',
                            width: 64,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                        controller.setRate(
                          vedioid: myVedio.id,
                          rate: 0,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
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
        child: SvgPicture.asset(
          'asset/images/rate2.svg',
          width: 64,
        ),
      );
    }

//asset/images/like.svg

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
                dense: true,
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
                trailing: IconRate,
                title: Text(
                  myVedio.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: KprimaryColor,
                  ),
                ),
                subtitle: Text(
                  myVedio.meta,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
            Divider(),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: SizedBox(
                    height: 200,
                    child: CustomImageCached(
                      imageUrl: myVedio.img,
                    ),
                  ),
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
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                width: double.infinity,
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Container(
                    height: 50,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(primary: KprimaryColor),
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
                        style: TextStyle(fontSize: 12),
                      ),
                      icon: Icon(Icons.done_all),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                width: Get.width,
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: KscandColor),
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
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
