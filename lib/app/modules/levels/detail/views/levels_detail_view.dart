import 'package:eradah/app/data/component/CustemButton.dart';
import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:eradah/app/modules/levels/detail/model/question.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/levels_detail_controller.dart';

class LevelsDetailView extends GetView<LevelsDetailController> {
  LevelsDetailController controller = Get.put(LevelsDetailController());

  @override
  Widget build(BuildContext context) {
    controller.getQestion(Get.arguments[0]);

    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments[2]),
        centerTitle: true,
      ),
      body: GetX(
          init: LevelsDetailController(),
          builder: (controller) {
            return FutureBuilder(
                future: controller.QestionListFutter.value,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Datum> data = snapshot.data;
                    return ListView(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 25,
                          ),
                          decoration: BoxDecoration(color: KprimaryColor),
                          child: Column(
                            children: [
                              Text(
                                Get.arguments[1],
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: List.generate(data.length, (index) {
                              Datum question = data.elementAt(index);
                              return Padding(
                                padding: EdgeInsets.all(20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                  child: Container(
                                    color: question.complate == "1"
                                        ? Colors.grey.shade200
                                        : Colors.white,
                                    padding: EdgeInsets.all(15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          question.title ?? '',
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(question.subTitle ?? ''),
                                        SizedBox(
                                          height: 10,
                                        ),
                                       question.complate == "1"
                                        ? SizedBox.shrink() : SizedBox(
                                          width: Get.width,
                                          child: CustemButton(
                                            buttonText: 'اكتمل؟',
                                            onPressed: () {
                                              controller
                                                  .setQestion(question.id);
                                            },
                                          ),
                                        ) 
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    );
                  }
                  return CircularProgressIndicator();
                });
          }),
    );
  }
}
