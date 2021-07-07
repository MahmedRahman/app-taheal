import 'package:eradah/app/api/response_model.dart';
import 'package:eradah/app/api/web_serives.dart';
import 'package:eradah/app/data/helper/AppConstant.dart';
import 'package:get/get.dart';

class SubscriptionController extends GetxController {
  //TODO: Implement SubscriptionController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void setSendBackage(int backageindex) async {
    ResponsModel responsModel =
        await WebSerives().setSendBackage(backage: backageindex);
    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['success']) {
        Get.snackbar(appName, response.body['message']);
      }
    }
  }
}
