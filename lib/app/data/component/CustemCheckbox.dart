import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustemCheckbox extends StatelessWidget {

  CustemCheckbox({
    @required this.checkboxText,
    @required this.onChanged,
    this.Checkboxdefaultvalue
  });

  final bool Checkboxdefaultvalue;
  final String checkboxText;
  final Function onChanged;
  var checked = false.obs;
  @override
  Widget build(BuildContext context) {

    return Obx(() {
      return Row(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Theme(
            data: ThemeData(
              unselectedWidgetColor: KprimaryColor, // Your color
            ),
            child: Checkbox(
              value: checked.value,
              onChanged: (bool newValue) {
                checked.value = newValue;
                onChanged(newValue);
              },
              hoverColor: KprimaryColor,
              activeColor: KprimaryColor.withOpacity(.3),
              checkColor: KprimaryColor,
            ),
          ),
          Text(
            checkboxText,
            textDirection: TextDirection.ltr,
            style: TextStyle(
                color: KprimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: 'Cairo'),
            textAlign: TextAlign.center,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.start,
      );
    });
  }
}
