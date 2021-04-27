import 'package:get/get.dart';

import 'package:eradah/app/modules/notifaction/controllers/notifaction_controller.dart';

class NotifactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotifactionController>(
      () => NotifactionController(),
    );
  }
}
