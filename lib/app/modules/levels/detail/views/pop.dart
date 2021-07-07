import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopScreen extends StatefulWidget {
  @override
  _PopScreenState createState() => _PopScreenState();
}

class _PopScreenState extends State<PopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تهانيا'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: Get.width,
              height: Get.height*.8 ,
              child: Image.asset('asset/images/img_leval.png'),
            ),
          ],
        ),
      ),
    );
  }
}
