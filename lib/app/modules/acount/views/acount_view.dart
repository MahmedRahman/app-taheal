import 'package:eradah/app/data/helper/AppConstant.dart';
import 'package:eradah/app/modules/acount/views/Privacy.dart';
import 'package:eradah/app/modules/acount/views/about.dart';
import 'package:eradah/app/modules/acount/views/subscription_paeg.dart';
import 'package:eradah/app/modules/acount/views/trems.dart';
import 'package:eradah/app/routes/app_pages.dart';
import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:eradah/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:eradah/app/modules/acount/controllers/acount_controller.dart';

class AcountView extends GetView<AcountController> {
  AcountController controller = Get.put(AcountController());
  List<String> Listimage = [
    'asset/account/01.svg',
    'asset/account/02.svg',
    'asset/account/03.svg',
    'asset/account/04.svg',
    'asset/account/05.svg',
    'asset/account/06.svg',
  ];

  List<String> Listlabel = [
    'تعديل الحساب',
    'مركز المساعدة',
    'حول ارادة',
    'الاشعارات',
    'اللغة',
    'تسجيل الخروج'
  ];

  @override
  Widget build(BuildContext context) {
    controller.mybackage();
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        title: Text(
          'حسابي',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Container(
            child: Center(
              child: ListView(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            width: 150,
                            child: Image.asset('asset/images/logo.png'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          Get.find<UserAuth>().getUserName(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          Get.find<UserAuth>().getUserEmail(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          backage_name.toString(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          start_backage.toString(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          end_backage.toString(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    children: [
                      ListTile(
                        onTap: () {},
                        title: Text(
                          'تعديل الحساب',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        trailing: SvgPicture.asset('asset/account/01.svg'),
                        leading: Icon(
                          Icons.arrow_forward_ios,
                          color: KprimaryColor,
                        ),
                      ),
                      /*  ListTile(
                          onTap: () {},
                          title: Text(
                            'مركز المساعدة',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          trailing: SvgPicture.asset('asset/account/02.svg'),
                          leading: Text('0100000000')),
                */

                      ListTile(
                        onTap: () {
                          Get.to(About());
                        },
                        title: Text(
                          'حول Doctor Child Care',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        trailing: SvgPicture.asset('asset/account/03.svg'),
                        leading: Icon(
                          Icons.arrow_forward_ios,
                          color: KprimaryColor,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Get.to(Privacy());
                        },
                        title: Text(
                          'سياسة الخصوصية',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        trailing: SvgPicture.asset('asset/account/03.svg'),
                        leading: Icon(
                          Icons.arrow_forward_ios,
                          color: KprimaryColor,
                        ),
                      ),
                      /*ListTile(
                        onTap: () {
                          Get.to(Trems());
                        },
                        title: Text(
                          'شروط واحكام',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        trailing: SvgPicture.asset('asset/account/03.svg'),
                        leading: Icon(
                          Icons.arrow_forward_ios,
                          color: KprimaryColor,
                        ),
                      ),*/
                      ListTile(
                        onTap: () {
                          Get.to(SubscriptionPage());
                        },
                        title: Text(
                          'صفحة الاشترك',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        trailing: SvgPicture.asset('asset/account/03.svg'),
                        leading: Icon(
                          Icons.arrow_forward_ios,
                          color: KprimaryColor,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Get.find<UserAuth>().setUserToken(null);
                          
                          Get.toNamed(Routes.SigninView);
                        },
                        title: Text(
                          'تسجيل الخروج',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        trailing: SvgPicture.asset('asset/account/06.svg'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
