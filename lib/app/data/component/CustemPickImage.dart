import 'dart:io';

import 'package:eradah/app/modules/authiocation/controllers/authiocation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustemPickImage extends StatelessWidget {
  const CustemPickImage({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final AuthiocationController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Container(
          constraints: BoxConstraints(
            minHeight: 100,
          ),
          child: SizedBox(
            width: Get.width,
            child: GestureDetector(
              onTap: () {
                controller.getImage();
              },
              child: controller.selectImagePath.value == ''
                  ? Container(
                      color: Colors.grey,
                      child: Center(
                        child: Text(
                          'أضافة ملف بيانات السجل الطبي للطفل',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        Container(
                          child: Image.file(
                            File(controller.cropperImagePath.value),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(controller.cropperImageSize.value)
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
