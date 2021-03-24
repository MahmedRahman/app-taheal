import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:eradah/app/modules/category/controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  List<String> CategoryList;

  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      body: Center(
        child: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(CategoryList.length, (index) {
            return InkWell(
              child: Center(
                child: Container(
                  width: Get.width,
                  height: Get.height,
                  child: Card(
                    child: SvgPicture.asset(
                      CategoryList.elementAt(index).toString(),
                 
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
