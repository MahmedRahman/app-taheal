import 'package:eradah/app/api/response_model.dart';
import 'package:eradah/app/api/web_serives.dart';
import 'package:eradah/app/modules/levels/detail/model/question.dart';
import 'package:get/get.dart';

class LevelsDetailController extends GetxController {
  //TODO: Implement LevelsDetailController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  getQestion(int quetionsid) async {
    ResponsModel responsModel = await WebSerives()
        .getQuetionsCategoryDetailes(quetionsid: quetionsid);
    if (responsModel.success) {
      Response response = responsModel.data;

      final quetionsModel = quetionsModelFromJson(response.bodyString);
      return quetionsModel.data;
    }
  }
}
