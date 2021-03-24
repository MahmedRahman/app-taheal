import 'dart:io';

import 'package:eradah/app/data/helper/AppConstant.dart';
import 'package:eradah/app/data/helper/AppEnumeration.dart';
import 'package:eradah/app/data/helper/AppUtils.dart';
import 'package:eradah/app/data/repostory.dart';
import 'package:eradah/app/modules/authiocation/model/StaticDataModel.dart';
import 'package:eradah/app/modules/authiocation/provider/authiocation_provider.dart';
import 'package:eradah/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AuthiocationController extends GetxController {
  var selectImagePath = ''.obs;
  var selectImageSize = ''.obs;

  var cropperImagePath = ''.obs;
  var cropperImageSize = ''.obs;

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
  var motorFunction = 0.obs;

  @override
  void onInit() {
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

    
   await AuthenticationProvider().prepareList().then((value) {
      print('=======================');
      print(value);

     
      final staticDataModel = staticDataModelFromJson(value);
      print(staticDataModel.data.elementAt(0).diagnostics);
      //Diagnosis.addAll(staticDataModel.data.elementAt(0).diagnostics) ;
      print('Diagnosis List');

      staticDataModel.data.elementAt(0).diagnostics.forEach((element) {
        Diagnosis.add({
          "id": "" + element.id.toString() + "",
          "title": "" + element.title.toString() + "",
        });
      });

      print('surgery List');
      staticDataModel.data.elementAt(0).surgeries.forEach((element) {
        surgery.add({
          "id": "" + element.id.toString() + "",
          "title": "" + element.title.toString() + "",
        });
      });

      print('splints List');
      staticDataModel.data.elementAt(0).medicalSplints.forEach((element) {
        splints.add({
          "id": "" + element.id.toString() + "",
          "title": "" + element.title.toString() + "",
        });
      });

      print('ListRlationShip List');

      staticDataModel.data.elementAt(0).listRlationShips.forEach((element) {
        ListRlationShip.add({
          "id": "" + element.id.toString() + "",
          "title": "" + element.title.toString() + "",
        });
      });

      print('MotorFunctions List');

      staticDataModel.data.elementAt(0).motorFunctions.forEach((element) {
        MotorFunctions.add({
          "id": "" + element.id.toString() + "",
          "title": "" + element.title.toString() + "",
          "image": "" + element.image.toString() + "",
        });
      });

      Get.toNamed(Routes.IntroView);
      
    }, onError: (err) {});

  
  }

  Future createUser() async {
    Get.toNamed(Routes.ProfileCreateView);

    await AuthenticationProvider()
        .createUser(
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
      beforeNineMonth: beforeNineMonth.value,
      file: file,
    )
        .then((value) {
      AppUtils().showSnackBar(
          title: appName,
          message: 'تم التسجيل بنجاح',
          snackbarStatus: () {
            Get.toNamed(Routes.SigninView);
          });
    }, onError: (err) {
      AppUtils().showSnackBar(
        title: appName,
        message: err,
        snackbarStatus: () {
          Get.toNamed(Routes.SignupView);
        },
      );
    });
  }
}
