import 'dart:ui';
import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustemDatePicker extends StatelessWidget {
  CustemDatePicker({@required this.title, this.onPressed});

  String title;
  var seletdate = ''.obs;
  Function onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(Icons.date_range),
        label: Obx(() {
          return Expanded(
              child: Text(
            seletdate.value == '' ? title : seletdate.value,
            textAlign: TextAlign.right,
          ));
        }),
        style: ElevatedButton.styleFrom(
          elevation: 2,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          primary: KprimaryColor.withOpacity(.6),
          alignment: Alignment.centerRight,
          shadowColor: Colors.transparent,
          textStyle: TextStyle(color: Colors.black),
        ),
        onPressed: () async {
          DateTime date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(
              days: 3285
            )),
            lastDate:  DateTime.now(),
          );
          FocusScope.of(context).unfocus();

          if (date != null) {
            seletdate.value = DateFormat('yyyy-MM-dd').format(date).toString();
            onPressed(seletdate.value);
          } else {
            onPressed('');
          }
        },
      ),
    );
  }
}
