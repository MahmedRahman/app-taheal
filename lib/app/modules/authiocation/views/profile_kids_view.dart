import 'dart:io';
import 'package:eradah/app/data/helper/AppConstant.dart';
import 'package:eradah/app/data/helper/AppValidation.dart';
import 'package:eradah/app/data/helper/showSnackBar.dart';
import 'package:eradah/app/modules/authiocation/controllers/authiocation_controller.dart';
import 'package:eradah/app/routes/app_pages.dart';
import 'package:eradah/app/data/helper/AppEnumeration.dart';
import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:eradah/app/data/component/CustemBottomSheet.dart';
import 'package:eradah/app/data/component/CustemCheckbox.dart';
import 'package:eradah/app/data/component/CustemDatePicker.dart';
import 'package:eradah/app/data/component/CustemDropdown.dart';
import 'package:eradah/app/data/component/CustemPickImage.dart';
import 'package:eradah/app/data/component/CustomTextFormFiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileKidsView extends GetView<AuthiocationController> {
  var kidsGender = 0.obs;

  List<String> genderImage = [
    'asset/Kides/boy.svg',
    'asset/Kides/girl.svg',
  ];

  List<String> genderTitle = [
    'ولد',
    'بنت',
  ];

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: KprimaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        child: Image.asset('asset/images/logo.png'),
                        width: 100,
                      ),
                      Text(
                        'أنشئ ملف طفلك',
                        style: headline3.copyWith(
                          fontSize: 16,
                          fontFamily: 'cairo',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      /*
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'ساعدنا في تخصص برنامجك وفقا لإحتياجات طفلك من خلال مشاركة بعض المعلومات الأساسية ',
                          style: headline3.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),*/
                      /*
                      Obx(() {
                        return Row(
                          textDirection: TextDirection.rtl,
                          children: List.generate(
                            2,
                            (index) {
                              return GestureDetector(
                                onTap: () {
                               controller.childGender.value = index;
                                },
                                child: Container(
                                  width: Get.width / 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: Get.width,
                                          height: 128,
                                          decoration: BoxDecoration(
                                              color: kidsGender.value == index
                                                  ? Colors.grey
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: SvgPicture.asset(
                                                genderImage.elementAt(index)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        );
                      }),
                    */
                    ],
                  ),
                ),
              ),
              Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: SingleChildScrollView(
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: Get.width * .9,
                                    child: Text(
                                      'بيانات الطفل',
                                      style: headline2.copyWith(),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  Obx(() {
                                    return CustomDropdownButton(
                                      listDropdown: ListKidsGender.map(
                                          (e) => e['name'].toString()).toList(),
                                      listDropdownValue: ListKidsGender.map(
                                              (e) =>
                                                  int.parse(e['id'].toString()))
                                          .toList(),
                                      labelDropdownButton: 'نوع بالطفل'.tr,
                                      selectText:
                                          kidsGender.value.toString().obs,
                                      onChanged: (value) {
                                        kidsGender.value =
                                            int.parse(value.toString());
                                        controller.childGender.value =
                                            int.parse(value.toString());

                                        // controller.s
                                      },
                                    );
                                  }),
                                  CustomTextFormFiled(
                                    inputLabel: 'اسم الطفل',
                                    inputHit: 'اسم الطفل',
                                    inputController: controller.childName,
                                    keyboardType: TextInputType.name,
                                    onValidator: (value) {
                                      return AppValidation.checkEmpty(value);
                                    },
                                  ),
                                  CustemDatePicker(
                                    title: controller.childBirthday.value == ""
                                        ? 'تاريخ الميلاد'
                                        : controller.childBirthday.value,
                                    onPressed: (value) {
                                      controller.childBirthday.value =
                                          value.toString();
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: Get.width * .9,
                                    child: Text(
                                      'بيانات السجل الطبي للطفل',
                                      style: headline2.copyWith(),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'ألتشخيص',
                                      style: headline2,
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  CustemBottomSheet(
                                    label: 'التشخيص',
                                    dataList: Diagnosis.map(
                                        (e) => e['title'].toString()).toList(),
                                    idList:
                                        Diagnosis.map((e) => int.parse(e['id']))
                                            .toList(),
                                    onPressed: (value) {
                                      controller.diagnostics.value = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'لعمليات جراحية؟',
                                      style: headline2,
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  CustemBottomSheet(
                                    label: 'لعمليات جراحية؟',
                                    dataList: surgery
                                        .map((e) => e['title'].toString())
                                        .toList(),
                                    idList: surgery
                                        .map((e) => int.parse(e['id']))
                                        .toList(),
                                    onPressed: (value) {
                                      controller.surgerySelect.value = value;
                                      print(value);
                                    },
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'جبائر طبية؟',
                                      style: headline2,
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  CustemBottomSheet(
                                    label: 'جبائر طبية؟',
                                    dataList: splints
                                        .map((e) => e['title'].toString())
                                        .toList(),
                                    idList: splints
                                        .map((e) => int.parse(e['id']))
                                        .toList(),
                                    onPressed: (value) {
                                      controller.medicalSplints.value = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustemPickImage(controller: controller),
                                  CustemCheckbox(
                                    checkboxText:
                                        'طفلي مولود قبل إكمال 37 اسبوع حمل',
                                    // Checkboxdefaultvalue: controller?.beforeNineMonth?.value?? false,
                                    onChanged: (value) {
                                      /*
                                      print(value);
                                      controller.beforeNineMonth.value =
                                          value;
                                          */
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * .9,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  KprimaryColor),
                            ),
                            onPressed: () {
                              bool validate = true;

                              if (controller.childBirthday.value == '') {
                                showSnackBar(
                                    title: appName,
                                    message: 'برجاء كتابة تاريخ ميلاد الطفل',
                                    snackbarStatus: () {});
                                validate = false;
                              }

                              if (controller.diagnostics.value == 0 ||
                                  controller.surgerySelect.value == 0 ||
                                  controller.medicalSplints.value == 0) {
                                showSnackBar(
                                    title: appName,
                                    message:
                                        '. برجاء أستكمال بيانات السجل الطبى للطفل',
                                    snackbarStatus: () {});
                                validate = false;
                              }
                              _formKey.currentState.validate();
                              if (validate) {
                                Get.toNamed(Routes.ProfilekidsMotorView);
                              }
                            },
                            child: Text(
                              'Next'.tr,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
