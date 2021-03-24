import 'dart:async';
import 'dart:io';
import 'package:eradah/app/data/repostory.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthenticationProvider extends RepostoryProvide {
  Future prepareList() async {
    return await repGet('List').then((Response response) {
      if (response.body['success']) {
        return response.bodyString;
      } else {
        return Future.error(response.body['message'].toString());
      }
    }, onError: (err) {
      return Future.error(err);
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
      'register',
      data,
    ).then((response) {
      if (response.body['success']) {
        return response.bodyString;
      } else {
        return Future.error(response.body['message'].toString());
      }
    }, onError: (err) {
      print(err);
    });
  }

  Future signInWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    final data = FormData({
      'email': email,
      'password': password,
    });

    return await repPost(
      'login',
      data,
    ).then((response) {
      if (response.body['success']) {
        return response.bodyString;
      } else {
        return Future.error(response.body['message'].toString());
      }
    }, onError: (err) {
      Future.error(err);
    });
  }
}
