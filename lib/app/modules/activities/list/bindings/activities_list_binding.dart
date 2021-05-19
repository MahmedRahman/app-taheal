import 'package:get/get.dart';

import '../controllers/activities_list_controller.dart';

class ActivitiesListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivitiesListController>(
      () => ActivitiesListController(),
    );
  }
}
