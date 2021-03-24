import 'dart:io';
import 'package:eradah/app/data/repostory.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthenticationProvider extends RepostoryProvide {
  //RepostoryProvide _repostoryProvide = RepostoryProvide();

  Future<Future<String>> prepareList() async {
    await repGet('List').then((Response response) {
      if (response.body['success']) {
        return response.bodyString;
      } else {
        return response.body['message'];
      }
    }, onError: (err) {
      return err;
    });
  }

  Future createUser(
      {@required String firstName,
      @required String lastName,
      @required String email,
      @required String password,
      @required String childName,
      @required int childGender,
      @required int relationChild,
      @required int motorFunction,
      @required String childBirthday,
      @required int diagnostics,
      @required int surgeries,
      @required int medicalSplints,
      String phone = '000000000',
      int beforeNineMonth = 0,
      String image = 'test',
      File file}) async {
    final data = FormData({
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'password_confirmation': password,
      'phone': phone,
      'child_name': childName,
      'child_gender': childGender,
      'relation_child': relationChild,
      'motor_function': motorFunction,
      'child_birthday': childBirthday,
      'before_nine_month': beforeNineMonth,
      'diagnostics': diagnostics,
      'surgeries': surgeries,
      'medical_splints': medicalSplints,
      'image': MultipartFile(file, filename: 'aa.jpg')
      //'image': MultipartFile(file,filename: 'aa.jpg'),
    });

    repPost(
      '$baes_url/register',
      data,
    ).then((response) {
      if (response.body['success']) {
        return response.bodyString;
      } else {
        return Future.error(response.body['message']);
      }
    });
  }
}
