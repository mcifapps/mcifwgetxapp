import 'package:get/get.dart';
import 'package:mcifwgetxapp/app/data/models/scanner_message_model.dart';
import 'package:mcifwgetxapp/app/data/models/tour_order_row_model.dart';

import 'package:mcifwgetxapp/app/data/providers/tour_provider.dart';

class TourOrderRowPickupController extends GetxController {
  int ordId = Get.arguments['ord_h_number'] ?? 0;
  int rowId = Get.arguments['ord_r_id'] ?? 0;
  int traId = Get.arguments['ord_h_tra_id'] ?? 0;
  int barId = Get.arguments['mcs_ana_barcode1'] ?? 0;

  final TourProvider tourProvider = Get.find<TourProvider>();
  
  RxList<TourOrderRowModel> tourorderrows = <TourOrderRowModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onReady() {
    print("pronto  controller TourOrderRowPickupController");
    super.onReady();
    fetchTourOrderRowsPickup();
    print("caricamento dati controller TourOrderRowPickupController");
  }

  
  void fetchTourOrderRowsPickup() async {

    var results = null;

    if(rowId==0){
      results = await tourProvider.getTourOrderRowsPickupWithBar(barId, ordId);
    }
    else{
      results = await tourProvider.getTourOrderRowsPickup(rowId);
    }

    print(ordId.toString());
    print(rowId.toString());
    print(traId.toString());
    print(barId.toString());

    // ignore: unnecessary_null_comparison
    if (results != null) {
      results.forEach((result) {
        tourorderrows.add(result);
      });
    }
    isLoading.value = false;
  }

  void onConfirmSetPickup(ord_h_number, ord_r_id) async{

    //se non hai un builder puoi richiamare la funzione con AWAIT per aspettare la funzione asincrona
    //List<ScannerMessageModel> message = await scannerProvider.setProductFromBarcode(mcs_ana_insertedbc.text, mcs_ana_code.text);

    List<ScannerMessageModel> message = await tourProvider.setTourOrderRowPickupFromBarcode(ord_h_number.toString(), ord_r_id.toString());

    print(ord_h_number);
    print(ord_r_id);

    print(message[0].mcs_ana_code);
    print(message[0].mcs_ana_desc);    
  }  

}
