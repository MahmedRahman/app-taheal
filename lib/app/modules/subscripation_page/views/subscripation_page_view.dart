import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/subscripation_page_controller.dart';

class SubscripationPageView extends GetView<SubscripationPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SubscripationPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SubscripationPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
