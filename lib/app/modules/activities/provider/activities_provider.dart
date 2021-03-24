import 'package:eradah/app/data/repostory.dart';
import 'package:get/get.dart';

class ActivitiesProvider extends RepostoryProvide {
  Future allCategories() async {
    Response response = await repGet('all_Categories');

    return response;
  }

  Future vedioCategories() async {
    Response response = await repGet('vedios_cat/1');

    return response;
  }
}
