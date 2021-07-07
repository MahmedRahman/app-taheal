import 'package:eradah/app/data/helper/AppConstant.dart';
import 'package:eradah/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Privacy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('سياسة الإستخدام'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(privace ,textAlign: TextAlign.right,)
        ),
      ),
    );
  }
}

      