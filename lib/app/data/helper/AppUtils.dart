import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUtils {
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

  void showSnackBar({
    @required String title,
    @required String message,
    @required Function snackbarStatus(),
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: KprimaryColor,
      colorText: Colors.white,
      overlayBlur: 4,
      borderWidth: 2,
      margin: EdgeInsets.all(10),
      borderColor: KprimaryColor,
      snackbarStatus: (value) {
        if (value == SnackbarStatus.CLOSED) {
          snackbarStatus();
        }
        
        //onstatusBarClosed(value);
      },
    );
  }
}

class KAccentColor {}
