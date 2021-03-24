import 'package:get/get.dart';

import 'package:eradah/app/modules/acount/controllers/acount_controller.dart';

class AcountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AcountController>(
      () => AcountController(),
    );
  }
}
