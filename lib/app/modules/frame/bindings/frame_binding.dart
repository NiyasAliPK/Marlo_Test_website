import 'package:get/get.dart';

import '../controllers/frame_controller.dart';

class FrameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FrameController>(
      () => FrameController(),
    );
  }
}
