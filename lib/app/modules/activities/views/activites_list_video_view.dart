import 'package:eradah/app/data/helper/AppConstant.dart';
import 'package:eradah/app/data/helper/showSnackBar.dart';
import 'package:eradah/app/modules/activities/controllers/activities_controller.dart';
import 'package:eradah/app/modules/activities/model/categoryvedioModel.dart';
import 'package:eradah/app/modules/activities/views/activities_view.dart';
import 'package:eradah/app/routes/app_pages.dart';
import 'package:eradah/app/data/component/CustemButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivitesListVideoView extends GetView {
  ActivitiesController controller = Get.put(ActivitiesController());

  List<int> id_vedio = new List<int>.empty(growable: true);

//Get.arguments[0].toString()

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('أسم النشاط'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              bulidSlider(),
              FutureBuilder(
                  future:
                      controller.vedioCategories(Get.arguments[0].toString()),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            '${snapshot.error} occured',
                            style: TextStyle(fontSize: 18),
                          ),
                        );
                      } else if (snapshot.hasData) {
                        List<Datum> data = snapshot.data;
                        return Column(
                          children: List.generate(data.length, (index) {
                            var select = false.obs;
                            return Card(
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: ListTile(
                                  title: Text(data.elementAt(index).title),
                                  subtitle:
                                      Text(data.elementAt(index).category),
                                  leading:
                                      Image.asset('asset/images/image.jpg'),
                                  trailing: Obx(() {
                                    return Checkbox(
                                      onChanged: (bool value) {
                                        if (value) {
                                          id_vedio
                                              .add(data.elementAt(index).id);
                                        } else {
                                          id_vedio
                                              .remove(data.elementAt(index).id);
                                        }

                                        print(id_vedio);

                                        select.value = value;
                                      },
                                      value: select.value,
                                    );
                                  }),
                                ),
                              ),
                            );
                          }),
                        );
                      }
                    }

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
              SizedBox(
                width: Get.width * .8,
                child: CustemButton(
                    buttonText: 'حفظ',
                    onPressed: () {
                      showSnackBar(
                        title: appName,
                        message: 'تم اضافة الفيديو الى خطتى',
                        snackbarStatus: () {
                          controller.addVideoToMyPlan(id_vedio);
                         // Get.toNamed(Routes.HOME);
                        },
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
