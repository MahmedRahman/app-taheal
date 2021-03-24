import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustemButton extends StatelessWidget {
  CustemButton({
    this.onPressed,
    this.buttonText,
  });

  final Function onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: KprimaryColor,
      ),
      onPressed: () {
        FocusScope.of(context).unfocus();
        onPressed();
      },
      child: Text(
        buttonText,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
