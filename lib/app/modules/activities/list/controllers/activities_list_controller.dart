import 'package:eradah/app/api/response_model.dart';
import 'package:eradah/app/api/web_serives.dart';
import 'package:eradah/app/modules/activities/list/model/ActivatyModel.dart';
import 'package:eradah/app/modules/activities/model/vedio_model.dart';
import 'package:get/get.dart';

class ActivitiesListController extends GetxController {
  //TODO: Implement ActivitiesListController


  @override
  void onInit() {
    super.onInit();
    allCategories();
  }

  var categoriesList = Future.value().obs;

  allCategories() async {
    ResponsModel responsModel = await WebSerives().allCategories();

    if (responsModel.success) {
      Response response = responsModel.data;


 final activatyModel = activatyModelFromJson(response.bodyString);
      //final vedioListModel = vedioListModelFromJson(response.bodyString);

      categoriesList.value = Future.value(activatyModel);
    }
  }
}
