import 'package:get/get.dart';
import 'package:mcifwgetxapp/app/data/models/tour_model.dart';

import 'package:mcifwgetxapp/app/data/providers/tour_provider.dart';

class TourController extends GetxController {
  final TourProvider tourProvider = Get.find<TourProvider>();
  RxList<TourModel> tours = <TourModel>[].obs;
  //List<TourModel> tours = <TourModel>[];
  RxBool isLoading = true.obs;

  @override
  void onClose() {
    print("Close TourController");
  }

  @override
  void onReady() {
    super.onReady();
    fetchTours();
  }

  void fetchTours() async {

    var results = await tourProvider.getTours();

    tours = <TourModel>[].obs;
    
    // ignore: unnecessary_null_comparison
    if (results != null) {
      results.forEach((result) {
        tours.add(result);
      });
    }
    isLoading.value = false;
  }
}
