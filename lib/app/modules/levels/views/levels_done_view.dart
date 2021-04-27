import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LevelsDoneView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LevelsDoneView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LevelsDoneView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
