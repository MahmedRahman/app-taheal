import 'package:eradah/app/data/helper/AppConstant.dart';
import 'package:eradah/app/data/helper/showSnackBar.dart';
import 'package:eradah/app/modules/activities/views/activities_view.dart';
import 'package:eradah/app/routes/app_pages.dart';
import 'package:eradah/app/data/component/CustemButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivitesListVideoView extends GetView {
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
              Column(
                children: List.generate(8, (index) {
                  return Card(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        title: Text('التحكم في الراأس الاول'),
                        subtitle: Text('(20 دقيقة)'),
                        leading: Image.asset('asset/images/image.jpg'),
                        trailing: Checkbox(
                          onChanged: (bool value) {},
                          value: false,
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(
                width: Get.width * .8,
                child: CustemButton(
                    buttonText: 'حفظ',
                    onPressed: () {
                      showSnackBar(
                        title: appName,
                        message: 'تم اضافة الفيديو الى خطتى',
                        snackbarStatus: () {
                          Get.toNamed(Routes.HOME);
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
