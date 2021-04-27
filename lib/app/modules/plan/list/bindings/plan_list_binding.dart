import 'package:get/get.dart';

import '../controllers/plan_list_controller.dart';

class PlanListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlanListController>(
      () => PlanListController(),
    );
  }
}
