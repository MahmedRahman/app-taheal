import 'package:get/get.dart';

import '../controllers/plan_detail_controller.dart';

class PlanDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlanDetailController>(
      () => PlanDetailController(),
    );
  }
}
