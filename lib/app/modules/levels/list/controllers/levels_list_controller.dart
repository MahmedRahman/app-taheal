import 'package:eradah/app/api/response_model.dart';
import 'package:eradah/app/api/web_serives.dart';
import 'package:eradah/app/modules/levels/list/model/quetions_category_model.dart';
import 'package:get/get.dart';

class LevelsListController extends GetxController {
  //TODO: Implement LevelsListController

  @override
  void onInit() {
    super.onInit();
  }

  getLevels() async {
    ResponsModel responsModel = await WebSerives().getQuetionsCategory();
    if (responsModel.success) {
      Response response = responsModel.data;
      final quetionsCategoryModel =
          quetionsCategoryModelFromJson(response.bodyString);
      return quetionsCategoryModel.data;
    }
  }
}
