import 'package:get/get.dart';

import '../controllers/trial_controller.dart';

class TrialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrialController>(
      () => TrialController(),
    );
  }
}
