import 'package:eradah/app/data/helper/AppConstant.dart';
import 'package:eradah/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Trems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
          appBar: AppBar(
            title: Text('شروط الأستخدام'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              child: Text(trems,textAlign: TextAlign.right,),
            ),
          )),
    );
  }
}
