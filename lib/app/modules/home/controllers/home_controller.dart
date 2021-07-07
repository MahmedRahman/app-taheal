import 'package:eradah/app/api/response_model.dart';
import 'package:eradah/app/api/web_serives.dart';
import 'package:eradah/app/data/helper/AppConstant.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  @override
  void onInit() {
   
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() => count.value++;

}
