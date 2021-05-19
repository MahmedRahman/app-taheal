import 'package:eradah/app/modules/authiocation/controllers/authiocation_controller.dart';
import 'package:eradah/app/routes/app_pages.dart';
import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SplashView extends GetView<AuthiocationController>  {
  

  AuthiocationController _auth = Get.put<AuthiocationController>(AuthiocationController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/images/bg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: InkWell(
            onTap: (){
              
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Get.width * .5,
                  child: Center(
                    child: Image.asset('asset/images/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
          
                Center(
                  child: Text(
                    'kid’s developmental milestone',
                    style: themeData.textTheme.headline5,
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LoadingIndicator(
                          indicatorType: Indicator.ballPulse,
                          color: KprimaryColor,
                        ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
