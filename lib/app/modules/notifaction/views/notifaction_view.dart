import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:eradah/app/modules/notifaction/controllers/notifaction_controller.dart';

class NotifactionView extends GetView<NotifactionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotifactionView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NotifactionView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  