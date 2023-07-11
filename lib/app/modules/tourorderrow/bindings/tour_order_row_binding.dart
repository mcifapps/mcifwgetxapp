import 'package:get/get.dart';
import 'package:mcifwgetxapp/app/modules/tourorderrow/controllers/tour_order_row_controller.dart';

class TourOrderRowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TourOrderRowController>(
      () => TourOrderRowController(),
    );
  }
}
