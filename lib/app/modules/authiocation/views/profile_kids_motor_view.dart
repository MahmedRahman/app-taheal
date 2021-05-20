import 'package:eradah/app/data/component/CustomImageCached.dart';
import 'package:eradah/app/data/helper/AppEnumeration.dart';
import 'package:eradah/app/modules/authiocation/controllers/authiocation_controller.dart';
import 'package:eradah/app/modules/authiocation/views/signin_view.dart';
import 'package:eradah/app/routes/app_pages.dart';
import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:eradah/app/data/component/CustemButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class ProfilekidsMotorView extends GetView<AuthiocationController> {
  List<String> CategoryList;

  var selectkidsMotor = '0'.obs;

  @override
  Widget build(BuildContext context) {

    print(selectkidsMotor.value == '0');
    
    CategoryList = [
      'asset/category/01.svg',
      'asset/category/02.svg',
      'asset/category/03.svg',
      'asset/category/04.svg',
      'asset/category/05.svg',
      'asset/category/06.svg',
      'asset/category/07.svg',
      'asset/category/08.svg',
    ];
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AuthiocationHeader(
              title: 'اختر الوظيفة الحركية الإجمالية لطفلك بناء على',
              subTitle:
                  'درجة أتزانه وأنماط حركته وحالة مفاصله وحالة الجهاز العضلي الحركي',
            ),
            Obx(() {
              return Container(
                child: Flexible(
                  flex: 9,
                  child: Container(
                    height: Get.height * .70,
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(MotorFunctions.length, (index) {


                        return InkWell(
                          onTap: () {
                            print(MotorFunctions.elementAt(index)['id'].toString());
                            selectkidsMotor.value = index.toString();
                            controller.motorFunction.value = int.parse(MotorFunctions.elementAt(index)['id']) ;
                          },
                          child: Card(
                            color: selectkidsMotor.value == index.toString()
                                ? Colors.grey
                                : Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(25),
                              child:CustomImageCached(imageUrl: MotorFunctions.elementAt(index)['image']
                                      .toString()),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              );
            }),
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: SizedBox(
                  width: Get.width * .9,
                  child: CustemButton(
                    buttonText: 'Next'.tr,
                    onPressed: () {

                      print('User Profile');

                      print('first_name');
                      print(controller.firstName.text);

                      print('last_name');
                      print(controller.lastName.text);

                      print('email');
                      print(controller.email.text);

                      print('child Gender');
                      print(controller.childGender.value);

                      print('Child Birthday');
                      print(controller.childBirthday.value);

                      print('diagnostics');
                      print(controller.diagnostics.value);

                      print('surgerySelect');
                      print(controller.surgerySelect.value);

                      print('medical_splints');
                      print(controller.medicalSplints.value);

                      print('before_nine_month');
                      print(controller.beforeNineMonth.value);

                      print('motorFunction');
                      print(controller.motorFunction.value);

                      controller.createUser();



                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
