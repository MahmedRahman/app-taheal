import 'package:get/get.dart';

import '../controllers/subscripation_page_controller.dart';

class SubscripationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubscripationPageController>(
      () => SubscripationPageController(),
    );
  }
}
