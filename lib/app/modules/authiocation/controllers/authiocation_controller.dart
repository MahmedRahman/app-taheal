import 'dart:io';

import 'package:eradah/app/api/response_model.dart';
import 'package:eradah/app/api/web_serives.dart';
import 'package:eradah/app/data/helper/AppConstant.dart';
import 'package:eradah/app/data/helper/AppEnumeration.dart';

import 'package:eradah/app/data/helper/showSnackBar.dart';

import 'package:eradah/app/modules/authiocation/model/StaticDataModel.dart';
import 'package:eradah/app/modules/authiocation/model/user.dart';
import 'package:eradah/app/modules/authiocation/model/userlogModel.dart';
import 'package:eradah/app/routes/app_pages.dart';
import 'package:eradah/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AuthiocationController extends GetxController {
  var selectImagePath = ''.obs;
  var selectImageSize = ''.obs;

  var cropperImagePath = ''.obs;
  var cropperImageSize = ''.obs;

  //var userModel = new User().obs ;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController childName = TextEditingController();
  File file;

  var childGender = 0.obs;
  var childBirthday = ''.obs;
  var diagnostics = 0.obs;
  var surgerySelect = 0.obs;
  var medicalSplints = 0.obs;
  var beforeNineMonth = 0.obs;
  var motorFunction = 1.obs;

  @override
  void onInit() {
    email.text = "mohamed02@gmail.com";
    password.text = "123123";
    super.onInit();
  }

  @override
  void onReady() async {
    //await prepareList();
    prepareList();
    super.onReady();
  }

  void getImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);

    if (pickedFile == null) {
      selectImagePath.value = '';
      selectImageSize.value = '';
    } else {
      selectImagePath.value = pickedFile.path.toString();
      selectImageSize.value =
          ((File(pickedFile.path).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2)) +
              ' MB';
    }

//corp corp corp corp corp corp corp corp corp

    final corpImageFile = await ImageCropper.cropImage(
        sourcePath: selectImagePath.value,
        maxWidth: 512,
        maxHeight: 512,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 80);
    cropperImagePath.value = corpImageFile.path;
    cropperImageSize.value =
        ((File(cropperImagePath.value).lengthSync() / 1024 / 1024)
                .toStringAsFixed(2)) +
            ' MB';

    file = File(cropperImagePath.value);
  }

  prepareList() async {
    ResponsModel responsModel = await WebSerives().prepareList();

    if (responsModel.success) {
      Response response = responsModel.data;
      final staticDataModel = staticDataModelFromJson(response.bodyString);
      staticDataModel.data.elementAt(0).diagnostics.forEach((element) {
        Diagnosis.add({
          "id": "" + element.id.toString() + "",
          "title": "" + element.title.toString() + "",
        });
      });

      staticDataModel.data.elementAt(0).surgeries.forEach((element) {
        surgery.add({
          "id": "" + element.id.toString() + "",
          "title": "" + element.title.toString() + "",
        });
      });

      staticDataModel.data.elementAt(0).medicalSplints.forEach((element) {
        splints.add({
          "id": "" + element.id.toString() + "",
          "title": "" + element.title.toString() + "",
        });
      });

      staticDataModel.data.elementAt(0).listRlationShips.forEach((element) {
        ListRlationShip.add({
          "id": "" + element.id.toString() + "",
          "title": "" + element.title.toString() + "",
        });
      });

      staticDataModel.data.elementAt(0).motorFunctions.forEach((element) {
        MotorFunctions.add({
          "id": "" + element.id.toString() + "",
          "title": "" + element.title.toString() + "",
          "image": "" + element.image.toString() + "",
        });
      });

      if (Get.find<UserAuth>().getUserToken() == null) {
        Get.toNamed(Routes.IntroView);
      } else {
        KuserName.value = Get.find<UserAuth>().getUserName();
        Get.toNamed(Routes.HOME);
      }
    }
  }

  createUser() async {
    Get.toNamed(Routes.ProfileCreateView);

    ResponsModel responsModel = await WebSerives().createUser(
      firstName: firstName.text,
      lastName: lastName.text,
      email: email.text,
      password: password.text,
      phone: phone.text,
      childName: childName.text,
      childGender: childGender.value,
      relationChild: 1,
      childBirthday: childBirthday.toString(),
      motorFunction: motorFunction.value,
      diagnostics: diagnostics.value,
      surgeries: surgerySelect.value,
      medicalSplints: medicalSplints.value,
      beforeNineMonth: 0,
      //file: file,
    );

    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['success']) {
        showSnackBar(
            title: appName,
            message: 'تم التسجيل بنجاح',
            snackbarStatus: () {
              Get.toNamed(Routes.SigninView);
            });
      } else {
        showSnackBar(
          title: appName,
          message: response.body['message'].toString(),
          snackbarStatus: () {
            Get.toNamed(Routes.SignupView);
          },
        );
      }
    }
  }

  signInWithEmailAndPassword() async {
    ResponsModel responsModel = await WebSerives().signInWithEmailAndPassword(
      email: email.text,
      password: password.text,
    );

    if (responsModel.success) {
      Response response = responsModel.data;
      final userlogModel = userlogModelFromJson(response.bodyString);

      var firstName = userlogModel.data.elementAt(0).childName.toString();
      var email = userlogModel.data.elementAt(0).email.toString();
      var accessToken = userlogModel.data.elementAt(0).accessToken.toString();
      KuserName.value  = firstName;

      Get.find<UserAuth>().setUserToken(accessToken);
      Get.find<UserAuth>().setUserEmail(email);
      Get.find<UserAuth>().setUserName(firstName);

      showSnackBar(
        title: appName,
        message: '$firstName اهلا بك فى التطبيق',
        snackbarStatus: () {
          Get.toNamed(Routes.TRIAL);
        },
      );
    }
  }
}
