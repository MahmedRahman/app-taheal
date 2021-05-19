import 'package:eradah/app/modules/acount/views/acount_view.dart';
import 'package:eradah/app/modules/activities/list/views/activities_list_view.dart';
import 'package:eradah/app/modules/levels/list/views/levels_list_view.dart';
import 'package:eradah/app/modules/plan/list/views/plan_list_view.dart';
import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:eradah/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  var selectindex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        title: Text(
          'الرئسية',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Obx(() {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: BottomNavigationBar(
            currentIndex: selectindex.value,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0XFFFAFAFA),
            selectedItemColor: KprimaryColor,
            unselectedItemColor: Color(0XFF707070),
            selectedFontSize: 14,
            unselectedFontSize: 14,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            onTap: (value) {
              selectindex.value = value;
              // Respond to item press.
            },
            items: [
              BottomNavigationBarItem(
                label: 'خطتى',
                icon: SizedBox(
                  width: 32,
                  height: 32,
                  child: SvgPicture.asset(
                    'asset/menu/plan.svg',
                    color: selectindex.value == 0 ? KprimaryColor : KscandColor,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: 'الانشطة',
                icon: SizedBox(
                  width: 32,
                  height: 32,
                  child: SvgPicture.asset(
                    'asset/menu/Activities.svg',
                    color: selectindex.value == 1 ? KprimaryColor : KscandColor,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: 'مستوياتي',
                icon: SizedBox(
                  width: 32,
                  height: 32,
                  child: SvgPicture.asset(
                    'asset/menu/levels.svg',
                    color: selectindex.value == 2 ? KprimaryColor : KscandColor,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: 'حسابى',
                icon: SizedBox(
                  width: 32,
                  height: 32,
                  child: SvgPicture.asset(
                    'asset/menu/menu.svg',
                    color: selectindex.value == 3 ? KprimaryColor : KscandColor,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
      body: Obx(() {
        return IndexedStack(index: selectindex.value, children: [
          PlanListView(),
          ActivitiesListView(),
            
           AcountView(),
          //LevelsListView(),
          AcountView(),
        ]);
      }),
    );
  }
}
