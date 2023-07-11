import 'package:get/get.dart';
import 'package:mcifwgetxapp/app/data/models/tour_order_row_model.dart';

import 'package:mcifwgetxapp/app/data/providers/tour_provider.dart';

class TourOrderRowController extends GetxController {
  int tourId = Get.arguments['ord_h_number'] ?? 0;

  final TourProvider tourProvider = Get.find<TourProvider>();
  
  RxList<TourOrderRowModel> tourorderrows = <TourOrderRowModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onReady() {
    super.onReady();
    fetchTourOrderRows();
  }

  void fetchTourOrderRows() async {

    var results = await tourProvider.getTourOrderRows(tourId);

    // ignore: unnecessary_null_comparison
    if (results != null) {
      results.forEach((result) {
        tourorderrows.add(result);
      });
    }
    isLoading.value = false;
  }
}
