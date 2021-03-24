import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlanVideoDetailesView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('التجارب المبكرة'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'asset/images/children-drawing-playing-carpet_23-2147797900.png',
                    ),
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
                  textDirection: TextDirection.rtl,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 15
                    ),
                    decoration: BoxDecoration(color: KprimaryColor),
                    child: ListTile(
                      title: Text(
                        'التجارب المبكرة',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      subtitle: Text(
                        'يوفر هذا التطبيق لجميع المعالم التنموية الحركية للأطفال في المستقبل يوفر هذا التطبيق لجميع المعالم التنموية ',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      leading: Icon(
                        Icons.category,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'المواد المقترحة',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: KprimaryColor,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'لعبة - كرة طبية - منشفة',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'الوصف',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: KprimaryColor,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'الطفل: الإستلقاء على الكرة الطبية مستندا على الساعدين يتم تمديد كلا الطرفين السفليين يتم ثني المرفقينن و الرأس في المنتصف المعالج: توجيه انتباه الطفل نحو التطع للاعلى بإستخدام المحفزات البصرية و السمعية الهدف : تقوية للعضلات العضدية و الكتفية و هو امر مهم لاستخدام الاطراف العلوية في تحمل الوزن و ايضا لتعزيز التحكم في الرأس',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
