import 'package:get/get.dart';
import 'package:mcifwgetxapp/app/data/models/tour_order_row_model.dart';

import 'package:mcifwgetxapp/app/data/providers/tour_provider.dart';

class TourOrderRowController extends GetxController {
  int ordId = Get.arguments['ord_h_number'] ?? 0;
  int rowId = Get.arguments['ord_r_id'] ?? 0;

  final TourProvider tourProvider = Get.find<TourProvider>();
  
  RxList<TourOrderRowModel> tourorderrows = <TourOrderRowModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit(){

    print("inizializzazione controller TourOrderRowController");
    super.onInit();
    print("fine inizializzazione controller TourOrderRowController");
  }

  @override
  void onReady() {

    print("pronto  controller TourOrderRowController");
    //onInit();
    super.onReady();
    fetchTourOrderRows();
    print("caricamento dati controller TourOrderRowController");
  }

  void fetchTourOrderRows() async {

    var results = await tourProvider.getTourOrderRows(ordId);

    print(ordId.toString());
    print(rowId.toString());

    // ignore: unnecessary_null_comparison
    if (results != null) {
      results.forEach((result) {
        tourorderrows.add(result);
      });
    }
    isLoading.value = false;
  }
}
