import 'package:eradah/app/api/response_model.dart';
import 'package:eradah/app/api/web_serives.dart';
import 'package:eradah/app/modules/activities/model/categoryvedioModel.dart';
import 'package:eradah/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ActivitiesDetailController extends GetxController {
  //TODO: Implement ActivitiesDetailController

Future vedioCategories(String vedios_cat_id) async {
    ResponsModel responsModel =
        await WebSerives().vedioCategories(vedios_cat_id: vedios_cat_id);

    if (responsModel.success) {
      Response response = responsModel.data;
      final categoryvedioModel =
          categoryvedioModelFromJson(response.bodyString);
      return categoryvedioModel.data;
    }
  }

  Future addVideoToMyPlan(List<int> id_vedio) async {
    String videoStr = id_vedio.join(',');
    print(videoStr);

    if (videoStr == '') {
    } else {
      ResponsModel responsModel =
          await WebSerives().addVideoToMyPlan(vedioid: videoStr);

      if (responsModel.success) {
        Response response = responsModel.data;
        if (response.body['success']) {
          Get.toNamed(Routes.HOME);
        }
      }
    }
  }
}
