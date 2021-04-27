import 'package:get/get.dart';

import '../controllers/levels_list_controller.dart';

class LevelsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LevelsListController>(
      () => LevelsListController(),
    );
  }
}
