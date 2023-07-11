import 'package:get/get.dart';
import 'package:mcifwgetxapp/app/modules/tourorder/controllers/tour_order_controller.dart';

class TourOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TourOrderController>(
      () => TourOrderController(),
    );
  }
}
