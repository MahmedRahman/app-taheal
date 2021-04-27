import 'package:eradah/app/data/component/CustemButton.dart';
import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LevelsDetaileView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('التحكم في الرأس'),
        centerTitle: true,
      ),
      body: ListView(
 
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            decoration: BoxDecoration(color: KprimaryColor),
            child: Column(
              children: [
                Text(
                  'أن احدي أولي المهارات التي ينميها الطفل هي القدرة علي رفع رأسه والتحكم بحركاتها,ولكي يتحكم الطفل جيدا بالرأس فانه يحتاج إلى أن يكون الجهاز الدهليزي سليم(هو جهاز إحساس يساهم في الحركة والإحساس بالتوازن، وهوالمسؤول عن التوازن ),و إلى عضلات رقبة سليمة, ثم وأخيرا إلى مستقبلات الحس العميق للرقبة سليم (هي حاسة الوضع النسبي للأجزاء المجاورة للجسم وقوة الجهود التي استخدمت في الحركة)',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'المهارات 1 من 4',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'تحققي من مراحل تطور المهارة التي بلغها طفلك وعن امكانياته وقدراته وعما تتوقعينه لاحقا',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'وضع عالمة علي انه مكتمل في حالة ما اتقن معاذ المهارة',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
           
            child: Column(
              children: List.generate(10, (index) {
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                         border: Border.all(color: Colors.blueAccent)
                    ),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'يمكنه إبقاء رأسه مرفوعة ويبدأ يدفعها لأعلى وهو مستلقٍ على بطنه',
                            textAlign: TextAlign.center,
                          ),
                          Text('عادة تتحقق في: عمر الشهرين'),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: Get.width,
                            child: CustemButton(
                              buttonText: 'اكتمل؟',
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
      ),
    );
  }


}
