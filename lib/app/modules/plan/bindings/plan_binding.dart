import 'package:get/get.dart';

import 'package:eradah/app/modules/plan/controllers/plan_controller.dart';

class PlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlanController>(
      () => PlanController(),
    );
  }
}
