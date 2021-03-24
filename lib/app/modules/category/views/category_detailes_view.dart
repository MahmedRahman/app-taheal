import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetailesView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('أختر الانشطة'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: Get.height * .3,
            color: Color(0xFFD60B6A),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'اختر المهارات المناسبة لمعاذ لتتأكد من طرق التحسين',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'حافظ على تقدم معاذ حتى الآن اضغط على أي مهارة لتحديث المستويات',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              trailing: Image.asset('asset/images/image.jpg'),
              title: Text('التحكم في الراأس الاول',textAlign: TextAlign.right,),
              subtitle: Text('(20 دقيقة)',textAlign: TextAlign.right,),
            ),
          ),
          Center(
            child: Text(
              'CategoryDetailesView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
