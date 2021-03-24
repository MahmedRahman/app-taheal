import 'package:eradah/app/data/helper/AppConstant.dart';
import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:eradah/app/data/helper/showSnackBar.dart';
import 'package:eradah/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:eradah/app/modules/plan/controllers/plan_controller.dart';

class PlanView extends GetView<PlanController> {
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

  Container bulidSlider() {
    return Container(
      height: Get.height * .3,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Positioned(
            right: 1,
            child: Container(),
          ),
          Positioned(
            left: 1,
            right: 1,
            child: Container(
              child: SvgPicture.asset(
                'asset/images/sliderbg2.svg',
                fit: BoxFit.cover,
              ),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 80,
                      ),
                      Text(
                        'اختر المهارات المناسبة لمعاذ لتتأكد من طرق التحسين',
                        style: TextStyle(
                          color: KprimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        child: Text(
                          'اشترك الان',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(primary: KprimaryColor),
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

class listVideo extends StatelessWidget {
  const listVideo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(10, (index) {
      return Card(
        elevation: 2,
        margin: EdgeInsets.all(15),
        child: InkWell(
          onTap: () {
            Get.toNamed(Routes.PlanVideoDetailesView);
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
                      child: SvgPicture.asset('asset/images/sign.svg'),
                    ),
                  ),
                  title: Text(
                    'التجارب المبكرة',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: KprimaryColor),
                  ),
                  subtitle: Text(
                    'يوفر هذا التطبيق لجميع المعالم التنموية الحركية للأطفال في المستقبل',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              Stack(
                children: [
                  Image.asset(
                      'asset/images/children-drawing-playing-carpet_23-2147797900.png'),
                  Positioned.fill(
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.grey.withOpacity(.4)),
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
                  style: ElevatedButton.styleFrom(primary: KprimaryColor),
                  onPressed: () {
                   showSnackBar(
                      title: appName,
                      message:
                          'تم الانتهاء من عمل النشاط اللزم وسيتنقل الى الانشطة السابقة',
                      snackbarStatus: () {},
                    );
                  },
                  label: Text('  وضع علامة على النشاط على أنه مكتمل  '),
                  icon: Icon(Icons.done_all),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(primary: KprimaryColor),
                        onPressed: () {
                          Get.defaultDialog(
                            title: 'التجارب المبكرة',
                            titleStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: KprimaryColor,
                              fontFamily: 'cairo',
                              fontSize: 20,
                            ),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'المواد المقترحة',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: KprimaryColor,
                                  ),
                                ),
                                Text(
                                  'لعبة - كرة طبية - منشفة',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'الوصف',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: KprimaryColor,
                                  ),
                                ),
                                Text(
                                  'الطفل: الإستلقاء على الكرة الطبية مستندا على الساعدين يتم تمديد كلا الطرفين السفليين يتم ثني المرفقينن و الرأس في المنتصف المعالج: توجيه انتباه الطفل نحو التطع للاعلى بإستخدام المحفزات البصرية و السمعية الهدف : تقوية للعضلات العضدية و الكتفية و هو امر مهم لاستخدام الاطراف العلوية في تحمل الوزن و ايضا لتعزيز التحكم في الرأس',
                                  textAlign: TextAlign.right,
                                )
                              ],
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
                        style: ElevatedButton.styleFrom(primary: KprimaryColor),
                        onPressed: () {
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.back();
                                          showSnackBar(
                                            title: appName,
                                            message: 'تم تقيم الفيديو',
                                            snackbarStatus: () {},
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
                                          showSnackBar(
                                            title: appName,
                                            message: 'تم تقيم الفيديو',
                                            snackbarStatus: () {},
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
    }));
  }
}
