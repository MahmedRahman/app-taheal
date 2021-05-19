import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:eradah/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/trial_controller.dart';

class TrialView extends GetView<TrialController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'ابدا الان',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: KprimaryColor,
                  fontSize: 25),
            ),
            SizedBox(
              height: 40,
            ),
            SvgPicture.asset('asset/images/trial_image.svg'),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                '7 DAYS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                'يوفر هذا التطبيق لجميع المعالم التنموية الحركية للأطفال في المستقبل',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: MaterialButton(
                color: KprimaryColor,
                onPressed: () {
                  Get.toNamed(Routes.HOME);
                },
                child: Text(
                  'ابدا الان',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
