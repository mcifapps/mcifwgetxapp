import 'package:get/get.dart';
import 'package:mcifwgetxapp/app/modules/tour/controllers/tour_controller.dart';

class TourBinding extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<TourController>( () => TourController(), );
    Get.put<TourController>(TourController());
  }
}
