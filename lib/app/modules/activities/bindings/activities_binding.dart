import 'package:get/get.dart';

import 'package:eradah/app/modules/activities/controllers/activities_controller.dart';

class ActivitiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivitiesController>(
      () => ActivitiesController(),
    );
  }
}
