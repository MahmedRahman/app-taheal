import 'package:eradah/app/api/response_model.dart';
import 'package:eradah/app/api/web_serives.dart';
import 'package:eradah/app/modules/plan/model/plan_video_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PlanListController extends GetxController {
  //TODO: Implement PlanListController

  var VedioComplateListFutter = Future.value().obs;
  var VedioNotComplateListFutter = Future.value().obs;

  @override
  void onInit() {
    super.onInit();
    getPlan();
  }

  getPlan() async {
    ResponsModel responsModel = await WebSerives().getPlan();
    if (responsModel.success) {
      Response response = responsModel.data;
      final videoPlanModel = videoPlanModelFromJson(response.bodyString);

      List<MyVedio> VedioList = [
        ...videoPlanModel.data.vediosMotorFunction,
        ...videoPlanModel.data.myVedio
      ];
print(videoPlanModel.data.vediosMotorFunction.length);
print(videoPlanModel.data.myVedio.length);
      print(VedioList.length);

      List<MyVedio> VedioComplateList =
          VedioList.where((element) => element.complate == "1").toList();

      List<MyVedio> VedioNotComplateList =
          VedioList.where((element) => element.complate != "1").toList();

      VedioComplateListFutter.value = Future.value(VedioComplateList);
      VedioNotComplateListFutter.value = Future.value(VedioNotComplateList);

      print(VedioComplateList.length);
      print(VedioNotComplateList.length);
    }
  }

  setRate({
    @required int vedioid,
    @required int rate,
  }) async {
    ResponsModel responsModel =
        await WebSerives().setRate(rate: rate, vedioid: vedioid);

    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['success']) {
        getPlan();
      }
    }
  }

  setCommplate({
    @required int vedioid,
    @required int omplate,
  }) async {
    ResponsModel responsModel = await WebSerives()
        .setViedoComplate(vedioid: vedioid, complateStaus: omplate);

    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['success']) {
        getPlan();
      }
    }
  }
}
