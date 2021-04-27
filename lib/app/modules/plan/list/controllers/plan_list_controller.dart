import 'package:eradah/app/api/response_model.dart';
import 'package:eradah/app/api/web_serives.dart';
import 'package:eradah/app/modules/plan/model/plan_video_model.dart';
import 'package:get/get.dart';

class PlanListController extends GetxController {
  //TODO: Implement PlanListController

  Future getPlan() async {
    ResponsModel responsModel = await WebSerives().getPlan();

    if (responsModel.success) {
      Response response = responsModel.data;

      final videoPlanModel = videoPlanModelFromJson(response.bodyString);

      List<MyVedio> VedioList = [
        ...videoPlanModel.data.vediosMotorFunction,
        ...videoPlanModel.data.myVedio
      ];

      // final videoPlanModel = videoPlanModelFromJson(response.bodyString);

      return VedioList;
    }
  }
}
