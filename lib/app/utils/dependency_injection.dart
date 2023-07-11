import 'package:mcifwgetxapp/app/data/providers/movie_provider.dart';
import 'package:mcifwgetxapp/app/data/providers/scanner_provider.dart';
import 'package:mcifwgetxapp/app/data/providers/tour_provider.dart';

import 'package:mcifwgetxapp/app/services/network_status_service.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() async {
    //provider
    Get.put<MovieProvider>(MovieProvider());
    Get.put<TourProvider>(TourProvider());
    Get.put<ScannerProvider>(ScannerProvider());

    //services
    Get.put<NetworkStatusService>(NetworkStatusService(), permanent: true);

  }
}
