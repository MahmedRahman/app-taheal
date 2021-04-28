import 'package:eradah/app/api/response_model.dart';
import 'package:eradah/app/api/web_serives.dart';
import 'package:eradah/app/modules/levels/detail/model/question.dart';
import 'package:get/get.dart';

class LevelsDetailController extends GetxController {
  var QuestionId;

  var QestionListFutter = Future.value().obs;

  getQestion(int quetionsid) async {
    QuestionId = quetionsid;
    ResponsModel responsModel =
        await WebSerives().getQuetionsCategoryDetailes(quetionsid: quetionsid);
    if (responsModel.success) {
      Response response = responsModel.data;

      final quetionsModel = quetionsModelFromJson(response.bodyString);
      QestionListFutter.value = Future.value(quetionsModel.data);
      //return quetionsModel.data;
    }
  }

  setQestion(int quetionsid) async {
    ResponsModel responsModel = await WebSerives().setQuetionComplate(
      quetionsid: quetionsid,
      complateStaus: 1,
    );

    if (responsModel.success) {
      Response response = responsModel.data;
      if(response.body['success']){
        
      }
      getQestion(QuestionId);
    }
  }
}
