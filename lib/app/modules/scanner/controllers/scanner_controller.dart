import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcifwgetxapp/app/data/models/product_drilldown_model.dart';
import 'package:mcifwgetxapp/app/data/models/scanner_message_model.dart';
import 'package:mcifwgetxapp/app/data/models/scanner_model.dart';

import 'package:mcifwgetxapp/app/data/providers/scanner_provider.dart';

class ScannerController extends GetxController {
  final ScannerProvider scannerProvider = Get.find<ScannerProvider>();

  RxList<ScannerModel> scanners = <ScannerModel>[].obs;
  RxBool isLoading = true.obs;

  Map<int, String> mapProductsForDrillDown = {};
  //RxMap mapProductsForDrillDown = {}.obs; //non posso provarlo perchè non è definito RxMap.fromEntries

  var mcs_ana_insertedbc_c  = TextEditingController();
  var mcs_ana_code_c        = TextEditingController();

  String barcodeId = Get.arguments['mcs_ana_insertedbc'] ?? '9000000000009';

  @override
  void onClose() {
    mcs_ana_insertedbc_c.dispose();
    mcs_ana_code_c.dispose();

    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    //fetchProductsForDrillDown();
  }

  @override
  void onReady() {
    super.onReady();
    fetchScanners(); //
    //fetchProductsForDrillDown();
  }
  /* */
  void fetchScanners() async {

    var results = await scannerProvider.getScanners(barcodeId);

    scanners = <ScannerModel>[].obs;
    
    // ignore: unnecessary_null_comparison
    if (results != null) {
      results.forEach((result) {

        //init TextEditingController
        mcs_ana_insertedbc_c =  TextEditingController(text: result.mcs_ana_insertedbc);
        mcs_ana_code_c = TextEditingController(text: result.mcs_ana_code);

        scanners.add(result);
      });
    }

    List<ProductDrillDownModel> searchedp =  await scannerProvider.getProductDrillDownModelList();

    mapProductsForDrillDown = Map.fromEntries(searchedp.map((value) => MapEntry(int.parse(value.mcs_ana_idx!), value.mcs_ana_find!)));

    isLoading.value = false;
  }
  /* 
  void fetchProductsForDrillDown() async {

    List<ProductDrillDownModel> searchedp =  await scannerProvider.getProductDrillDownModelList();

    mapProductsForDrillDown = Map.fromEntries(searchedp.map((value) => MapEntry(int.parse(value.mcs_ana_idx!), value.mcs_ana_find!)));
  }
  */

  void onConfirmSetProductFromBarcode(mcs_ana_insertedbc, mcs_ana_code) async{

    //se non hai un builder puoi richiamare la funzione con AWAIT per aspettare la funzione asincrona
    List<ScannerMessageModel> message = await scannerProvider.setProductFromBarcode(mcs_ana_insertedbc.text, mcs_ana_code.text);

    print(message[0].mcs_ana_code);
    print(message[0].mcs_ana_desc);
  }  
}
