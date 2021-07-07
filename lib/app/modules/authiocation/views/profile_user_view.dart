import 'package:eradah/app/data/helper/AppValidation.dart';
import 'package:eradah/app/modules/authiocation/controllers/authiocation_controller.dart';
import 'package:eradah/app/routes/app_pages.dart';
import 'package:eradah/app/data/helper/AppEnumeration.dart';
import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:eradah/app/data/component/CustemButton.dart';
import 'package:eradah/app/data/component/CustemDropdown.dart';
import 'package:eradah/app/data/component/CustomTextFormFiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileUserView extends GetView<AuthiocationController> {
  var familyType = 1.obs;

  List<String> genderImage = [
    'asset/images/father.svg',
    'asset/images/mother.svg',
    'asset/images/family.svg',
  ];

  List<String> genderTitle = [
    'الاب',
    'الأم',
    'من العائلة',
  ];

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    print(ListRlationShip.length.toString());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: KprimaryColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: Image.asset('asset/images/logo.png'),
                      width: 100,
                    ),
                    Container(
                      width: Get.width,
                      child: Text(
                        'أنشئ ملف الشخصي',
                        style: headline3.copyWith(
                          fontSize: 16,
                          fontFamily: 'cairo',
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    /*Text(
                      'ساعدنا في تخصص برنامجك وفقا لإحتياجات طفلك من خلال مشاركة بعض المعلومات الأساسية ',
                      style: headline3.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'cairo',
                      ),
                      textAlign: TextAlign.center,
                    ),*/
                    SizedBox(
                      height: 20,
                    ),
                    /*  Obx(() {
                      return Row(
                        textDirection: TextDirection.rtl,
                        children: List.generate(
                          3,
                          (index) {
                            return GestureDetector(
                              onTap: () {
                                familyType.value = index;
                              },
                              child: Container(
                                width: Get.width / 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: Get.width,
                                        height: 128,
                                        decoration: BoxDecoration(
                                          color: familyType.value == index
                                              ? Colors.grey
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: SvgPicture.asset(
                                            genderImage.elementAt(index),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        genderTitle.elementAt(index),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
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
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: Get.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                width: Get.width * .9,
                                child: Text(
                                  'بيانات شخصية',
                                  style: headline2.copyWith(),
                                  textAlign: TextAlign.right,
                                ),
                              ),   SizedBox(
                                height: 15,
                              ),
                              Obx(() {
                                return CustomDropdownButton(
                                  listDropdown: ListRlationShip.map(
                                      (e) => e['title'].toString()).toList(),
                                  listDropdownValue: ListRlationShip.map(
                                          (e) => int.parse(e['id'].toString()))
                                      .toList(),
                                  labelDropdownButton: 'علاقات بالطفل'.tr,
                                  selectText: familyType.value.toString().obs,
                                  onChanged: (value) {
                                    // print(value.toString());
                                    familyType.value =
                                        int.parse(value.toString());
                                    // controller.s
                                  },
                                );
                              },),  SizedBox(
                                height: 10,
                              ),
                              CustomTextFormFiled(
                                inputLabel: 'الاسم الاول',
                                inputHit: 'الاسم الاول',
                                inputController: controller.firstName,
                                keyboardType: TextInputType.text,
                                onValidator: (value) {
                                  return AppValidation.checkEmpty(value);
                                },
                              ),
                              CustomTextFormFiled(
                                inputLabel: 'اسم العائلة',
                                inputHit: 'اسم العائلة',
                                inputController: controller.lastName,
                                keyboardType: TextInputType.text,
                                onValidator: (value) {
                                  return AppValidation.checkEmpty(value);
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),


/*
                              SizedBox(
                                width: Get.width * .9,
                                child: Text(
                                  'بيانات التواصل',
                                  style: headline2.copyWith(),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextFormFiled(
                                        inputLabel: 'رقم الهاتف',
                                        inputHit: 'رقم الهاتف',
                                        inputController: controller.phone,
                                        keyboardType: TextInputType.number,
                                        onValidator: (value) {
                                          //return AppValidation.checkMobile(value);
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      '+02',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                         */
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: Get.width * .9,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: CustemButton(
                            buttonText: 'Next'.tr,
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                Get.toNamed(Routes.ProfileKidsView);
                              }
                            },
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
