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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('asset/images/StartSubscription.png'))
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                  height: Get.height*.8,
              ),
             
              Padding(
                padding: const EdgeInsets.all(30),
                child: MaterialButton(
                  color: KprimaryColor,
                  height: 60,
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
      ),
    );
  }
}
