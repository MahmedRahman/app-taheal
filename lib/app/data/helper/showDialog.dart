 import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showDialog(String title, String content, Function onPressed) {
    Get.defaultDialog(
      title: title,
      titleStyle: TextStyle(
        color: KprimaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      radius: 10,
      middleText: 'Save Done'.tr,
      content: Container(
        child: Column(
          children: [
            Text(
              content,
              style: TextStyle(
                color: KprimaryColor,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      confirm: RaisedButton(
        color: KprimaryColor,
        child: Text('Done'.tr),
        elevation: 2,
        onPressed: onPressed,
      ),
      backgroundColor: KprimaryColor,
      buttonColor: KprimaryColor,
      barrierDismissible: false,
    );
  }
