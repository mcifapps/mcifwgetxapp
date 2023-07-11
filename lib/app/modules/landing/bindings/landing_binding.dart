import 'package:get/get.dart';
import 'package:mcifwgetxapp/app/modules/landing/controllers/landing_controller.dart';

class LandingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandingController>(
      () => LandingController(),
    );
  }
}
