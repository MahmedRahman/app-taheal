import 'dart:io';

import 'package:eradah/app/api/response_model.dart';
import 'package:eradah/app/api/web_serives.dart';
import 'package:eradah/app/data/helper/AppConstant.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AcountController extends GetxController {
  //TODO: Implement AcountController

  final count = 0.obs;

  @override
  void onInit() {
    loadAssettrems().then((value) => trems = value);

    loadAssetPrivacy().then((value) => privace = value);

    loadAssetAbout().then((value) => about = value);
  }

  void mybackage() async {
    
    ResponsModel responsModel = await WebSerives().getMyBackage();

    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['data'].length != 0) {
        backage_name = response.body['data'][0]['backage_name'];
        start_backage = response.body['data'][0]['start_backage'];
        end_backage = response.body['data'][0]['end_backage'];
      } else {
backage_name = '';
    start_backage = '';
    end_backage = '';
      }
    } 
  }

  Future<String> loadAssettrems() async {
    return await rootBundle.loadString('asset/images/trems.txt');
  }

  Future<String> loadAssetPrivacy() async {
    return await rootBundle.loadString('asset/images/Privacy.txt');
  }

    Future<String> loadAssetAbout() async {
    return await rootBundle.loadString('asset/images/about.txt');
  }
}
