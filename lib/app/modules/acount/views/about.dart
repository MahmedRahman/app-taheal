import 'package:eradah/app/data/helper/AppConstant.dart';
import 'package:eradah/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('حول المشروع'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
          child: Text(about ,textAlign: TextAlign.right,)
          
        ),
      ),
    );
  }
}

      