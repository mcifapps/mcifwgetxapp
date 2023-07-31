import 'package:get/get.dart';
import 'package:mcifwgetxapp/app/modules/tourorderrowpickup/controllers/tour_order_row_pickup_controller.dart';

class TourOrderRowPickupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TourOrderRowPickupController>(
      () => TourOrderRowPickupController(),
    );
  }
}
