import 'dart:io';

import 'package:flutter/material.dart';

class User {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController childName = TextEditingController();
  var childGender;
  var childBirthday;
  var diagnostics;
  var surgerySelect;
  var medicalSplints;
  var beforeNineMonth;
  var motorFunction;
  File file;
}
