import 'package:get/get.dart';
import 'package:mcifwgetxapp/app/modules/scanner/controllers/scanner_controller.dart';

class ScannerBinding extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<ScannerController>( () => ScannerController(), );
    Get.put<ScannerController>(ScannerController());
  }
}
