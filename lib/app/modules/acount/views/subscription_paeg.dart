import 'package:eradah/app/data/helper/AppConstant.dart';
import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:eradah/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SubscriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('صفحة الاشترك'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          child: Column(
            children: [
              Image.asset('asset/images/logo.png'),
              SizedBox(
                height: 20,
              ),
              Card(
                child: ListTile(
                  title: Text('الباقة',textAlign: TextAlign.right,),
                  subtitle: Text(backage_name.toString(),textAlign: TextAlign.right,),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('تاريخ البداية',textAlign: TextAlign.right,),
                  subtitle: Text(start_backage.toString(),textAlign: TextAlign.right,),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('تاريخ النهائية',textAlign: TextAlign.right,),
                  subtitle: Text(end_backage.toString(),textAlign: TextAlign.right,),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: Get.width * .9,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.SUBSCRIPTION);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(KprimaryColor),
                  ),
                  child: Text('تجديد الاشترك'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
