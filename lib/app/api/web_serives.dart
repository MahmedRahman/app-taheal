import 'package:eradah/app/modules/plan/list/controllers/plan_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eradah/app/api/api_manger.dart';
import 'package:eradah/app/api/response_model.dart';

class WebSerives {
  Future allCategories() async {
    ResponsModel responsModel = await APIManger().repGet('all_Categories');
    return responsModel;
  }

  Future getPlan() async {
    ResponsModel responsModel = await APIManger().repGet('myplan');
    return responsModel;
  }

  Future vedioCategories({String vedios_cat_id}) async {
    ResponsModel responsModel =
        await APIManger().repGet('vedios_cat/' + vedios_cat_id.toString());
    return responsModel;
  }

  Future prepareList() async {
    ResponsModel responsModel = await APIManger().repGet('List');
    return responsModel;
  }

  createUser({
    @required String firstName,
    @required String lastName,
    @required String email,
    @required String password,
    @required String childName,
    @required int childGender,
    @required int relationChild,
    @required int motorFunction,
    @required String childBirthday,
    @required int diagnostics,
    @required int surgeries,
    @required int medicalSplints,
    String phone = '000000000',
    int beforeNineMonth = 0,
    String image = 'test',
  }) async {
    //final data = FormData();

    ResponsModel responsModel = await APIManger().repPost(
      'register',
      body: {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'password': password,
        'password_confirmation': password,
        'phone': phone,
        'child_name': childName,
        'child_gender': childGender,
        'relation_child': relationChild,
        'motor_function': motorFunction,
        'child_birthday': childBirthday,
        'before_nine_month': beforeNineMonth,
        'diagnostics': diagnostics,
        'surgeries': surgeries,
        'medical_splints': medicalSplints,
        // 'image': MultipartFile(file, filename: 'aa.jpg')
        //'image': MultipartFile(file,filename: 'aa.jpg'),
      },
    );
    return responsModel;
  }

  Future signInWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    // final data = FormData();

    ResponsModel responsModel = await APIManger().repPost('login',
        body: {
          'email': email,
          'password': password,
        },
        showLoading: true);

    return responsModel;
  }

  Future addVideoToMyPlan({@required String vedioid}) async {
    print(vedioid);
    ResponsModel responsModel = await APIManger()
        .repPost('add_my_plan', body: {'vedio': vedioid}, showLoading: true);
    PlanListController().getPlan();
    return responsModel;
  }

  Future setRate({@required int vedioid, @required int rate}) async {
    ResponsModel responsModel = await APIManger().repPost('Rate',
        body: {'rate': rate, 'vedio': vedioid}, showLoading: true);
    return responsModel;
  }

  Future getQuetionsCategory() async {
    ResponsModel responsModel = await APIManger().repGet('cats_quetions');
    return responsModel;
  }

  Future getMyBackage() async {
    ResponsModel responsModel = await APIManger().repGet('my_backage');
    return responsModel;
  }

  Future setSendBackage({@required int backage}) async {
    ResponsModel responsModel = await APIManger().repPost(
      'send_backage',
      body: {'backage': backage},
      showLoading: true,
    );
    return responsModel;
  }

  Future getQuetionsCategoryDetailes({
    @required int quetionsid,
  }) async {
    ResponsModel responsModel =
        await APIManger().repGet('quetions/' + quetionsid.toString());
    return responsModel;
  }

  Future setQuetionComplate({
    @required int quetionsid,
    int complateStaus,
  }) async {
    ResponsModel responsModel = await APIManger().repPost(
      'complate_quetion',
      body: {'complate': complateStaus, 'quetion': quetionsid},
      showLoading: true,
    );
    return responsModel;
  }

  Future setViedoComplate({
    @required int vedioid,
    int complateStaus,
  }) async {
    ResponsModel responsModel = await APIManger().repPost('complate_vedio',
        body: {
          'complate': complateStaus,
          'vedio': vedioid,
        },
        showLoading: true);
    return responsModel;
  }
}
