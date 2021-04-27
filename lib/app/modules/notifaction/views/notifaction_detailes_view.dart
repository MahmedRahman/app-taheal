import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

class NotifactionDetailesView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotifactionDetailesView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NotifactionDetailesView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  