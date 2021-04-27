import 'package:eradah/app/api/response_model.dart';
import 'package:eradah/app/api/web_serives.dart';
import 'package:eradah/app/modules/activities/model/categoryvedioModel.dart';
import 'package:eradah/app/modules/activities/model/vedio_model.dart';
import 'package:eradah/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ActivitiesController extends GetxController {
  Future allCategories() async {
    ResponsModel responsModel = await WebSerives().allCategories();

    if (responsModel.success) {
      Response response = responsModel.data;
      final vedioListModel = vedioListModelFromJson(response.bodyString);
      return vedioListModel.data;
    }
  }

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

/*

    String videoStr ='';
    int i = 1;
    id_vedio.forEach((element) {
      if (i == 1) {
        videoStr = videoStr + element.toString();
        i = 0;
      } else {
        videoStr = videoStr + ',' + element.toString();
      }
    });
*/
String videoStr =id_vedio.join(',');
    print(videoStr);
    

if(videoStr =='') {} else {
    ResponsModel responsModel =
        await WebSerives().addVideoToMyPlan(vedioid: videoStr);

    if (responsModel.success) {
      Response response = responsModel.data;
      if(response.body['success']) {
        Get.toNamed(Routes.HOME);
      }
    }
}


  }
}
