import 'package:eradah/app/data/component/CustomImageCached.dart';
import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:eradah/app/modules/activities/list/views/activities_list_view.dart';
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
            appBar: AppBar(
        leading: SizedBox.shrink(),
        title: Text(
          'مستوياتي',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
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


}
