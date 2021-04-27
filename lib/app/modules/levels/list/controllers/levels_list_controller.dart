import 'package:eradah/app/api/response_model.dart';
import 'package:eradah/app/api/web_serives.dart';
import 'package:eradah/app/modules/levels/list/model/quetions_category_model.dart';
import 'package:get/get.dart';

class LevelsListController extends GetxController {
  //TODO: Implement LevelsListController

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

getLevels() async {
 ResponsModel responsModel = await WebSerives().getQuetionsCategory();
 if(responsModel.success){
   Response response = responsModel.data;
    final quetionsCategoryModel = quetionsCategoryModelFromJson(response.bodyString);
    return quetionsCategoryModel.data;
 }
}


}
