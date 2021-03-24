import 'package:eradah/app/modules/activities/model/categoryvedioModel.dart';
import 'package:eradah/app/modules/activities/model/vedio_model.dart';
import 'package:eradah/app/modules/activities/provider/activities_provider.dart';
import 'package:get/get.dart';

class ActivitiesController extends GetxController {
  //TODO: Implement ActivitiesController
  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

  Future allCategories() async {
    
    Response response = await ActivitiesProvider().allCategories();

    final vedioListModel = vedioListModelFromJson(response.bodyString);

    return vedioListModel.data;
  }


    Future vedioCategories() async {
       Response response = await ActivitiesProvider().vedioCategories();
  final categoryvedioModel = categoryvedioModelFromJson(response.bodyString);

      return categoryvedioModel.data;
  }
}
