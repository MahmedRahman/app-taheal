import 'package:get/get.dart';

import '../controllers/levels_detail_controller.dart';

class LevelsDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LevelsDetailController>(
      () => LevelsDetailController(),
    );
  }
}
