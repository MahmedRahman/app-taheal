import 'package:get/get.dart';

import 'package:eradah/app/modules/levels/controllers/levels_controller.dart';

class LevelsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LevelsController>(
      () => LevelsController(),
    );
  }
}
