import 'package:eradah/app/data/helper/AppConstant.dart';
import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/subscription_controller.dart';

class SubscriptionView extends GetView<SubscriptionController> {
  var selectindex = 1.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('أشترك الان'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          SizedBox(
            width: 180,
            height: 180,
            child: SvgPicture.asset('asset/images/intro1.svg'),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Center(
              child: Text(
                'تؤثر التجارب المبكرة لطفلك على نمو بنية دماغه يوفر هذا التطبيق لجميع المعالم التنموية الحركية للأطفال في المستقبل',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Obx(() {
            return Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      selectindex.value = 2;
                    },
                    child: Container(
                      height: 150,
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectindex.value == 2
                              ? Color(0xffD60B51)
                              : Colors.black,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              priceList.elementAt(0)['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              priceList.elementAt(0)['price'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      selectindex.value = 1;
                    },
                    child: Container(
                      color: Colors.grey,
                      height: 150,
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectindex.value == 1
                              ? Color(0xffD60B51)
                              : Colors.black,
                        ),
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              priceList.elementAt(1)['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              priceList.elementAt(1)['price'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            );
          }),
          SizedBox(
            height: 60,
          ),
          Container(
            width: Get.width,
            child: Center(
              child: Text(
                'الفواتير المكررة. إلغاء في أي وقت',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: Get.width * .8,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                controller.setSendBackage(selectindex.value);
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(KprimaryColor),
              ),
              child: Text(' اشترك الان '),
            ),
          )
        ],
      ),
    );
  }
}
