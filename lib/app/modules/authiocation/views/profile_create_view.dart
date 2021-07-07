import 'package:eradah/app/modules/authiocation/controllers/authiocation_controller.dart';
import 'package:eradah/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ProfileCreateView extends GetView<AuthiocationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InkWell(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'برجاء الانتظار',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: Get.width * .5,
              child: Lottie.asset('asset/Kides/Kids_profile.json'),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: Get.width * .8,
              child: Text(
                'جاري إنشاء خطة علاجية لطفلك بناءاً على درجة أتزانه وأنماط حركته وحالة مفاصله وحالة الجهاز العضلي الحركي',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
