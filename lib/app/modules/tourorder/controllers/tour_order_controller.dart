import 'package:get/get.dart';
import 'package:mcifwgetxapp/app/data/models/tour_order_model.dart';

import 'package:mcifwgetxapp/app/data/providers/tour_provider.dart';

class TourOrderController extends GetxController {
  int tourId = Get.arguments['emp_tra_id'] ?? 0;

  final TourProvider tourProvider = Get.find<TourProvider>();
  
  RxList<TourOrderModel> tourorders = <TourOrderModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onReady() {
    super.onReady();
    fetchTourOrders();
  }

  void fetchTourOrders() async {

    var results = await tourProvider.getTourOrders(tourId);

    // ignore: unnecessary_null_comparison
    if (results != null) {
      results.forEach((result) {
        tourorders.add(result);
      });
    }
    isLoading.value = false;
  }
}
