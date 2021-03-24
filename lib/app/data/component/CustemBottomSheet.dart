import 'package:eradah/app/data/helper/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustemBottomSheet extends StatelessWidget {
  CustemBottomSheet({
    @required this.dataList,
    @required this.idList,
    @required this.onPressed,
    this.label,
  });

  List<String> dataList;
  List<int> idList;

  var label;
  var seletetext = ''.obs;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          primary: KprimaryColor.withOpacity(.6),
          alignment: Alignment.centerRight,
          shadowColor: Colors.transparent,
          textStyle: TextStyle(color: Colors.black),
        ),
        label: Obx(() {
          return Expanded(
            child: Text(
              seletetext.value == '' ? label : seletetext.value,
              textAlign: TextAlign.right,
            ),
          );
        }),
        onPressed: () {
          FocusScope.of(context).unfocus();
          Get.bottomSheet(
            Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                          ),
                          Text(
                            label,
                            style: headline2,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: List.generate(
                        dataList.length,
                        (index) {
                          return Column(
                            children: [
                              ListTile(
                                title: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text(
                                    dataList.elementAt(index),
                                  ),
                                ),
                                selected: seletetext.value ==
                                        dataList.elementAt(index)
                                    ? true
                                    : false,
                                onTap: () {
                                  seletetext.value =
                                      dataList.elementAt(index).toString();
                              
                                  onPressed(idList.elementAt(index));
                                  Get.back();
                                },
                              ),
                              Divider(
                                color: KprimaryColor,
                                thickness: 1,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        icon: Icon(Icons.arrow_circle_down),
      ),
    );
  }
}
