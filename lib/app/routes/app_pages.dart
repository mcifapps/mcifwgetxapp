import 'package:get/get.dart';

import 'package:mcifwgetxapp/app/modules/details/bindings/details_binding.dart';
import 'package:mcifwgetxapp/app/modules/details/views/details_view.dart';
import 'package:mcifwgetxapp/app/modules/home/bindings/home_binding.dart';
import 'package:mcifwgetxapp/app/modules/home/views/home_view.dart';
import 'package:mcifwgetxapp/app/modules/scanner/bindings/scanner_binding.dart';
import 'package:mcifwgetxapp/app/modules/scanner/views/scanner_view.dart';
import 'package:mcifwgetxapp/app/modules/tour/bindings/tour_binding.dart';
import 'package:mcifwgetxapp/app/modules/tour/views/tour_view.dart';
import 'package:mcifwgetxapp/app/modules/tourorder/bindings/tour_order_binding.dart';
import 'package:mcifwgetxapp/app/modules/tourorder/views/tour_order_view.dart';
import 'package:mcifwgetxapp/app/modules/tourorderrow/bindings/tour_order_row_binding.dart';
import 'package:mcifwgetxapp/app/modules/tourorderrow/views/tour_order_row_view.dart';
import 'package:mcifwgetxapp/app/modules/landing/views/landing_view.dart';
import 'package:mcifwgetxapp/app/modules/landing/bindings/landing_binding.dart';
import 'package:mcifwgetxapp/app/modules/tourorderrowpickup/bindings/tour_order_row_pickup_binding.dart';
import 'package:mcifwgetxapp/app/modules/tourorderrowpickup/views/tour_order_row_pickup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  //static const INITIAL = Routes.HOME;
  static const INITIAL = Routes.MCIF;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAILS,
      page: () => DetailsView(),
      binding: DetailsBinding(),
    ),
    GetPage(
      name: _Paths.TOUR,
      page: () => TourView(),
      binding: TourBinding(),
    ),    
    GetPage(
      name: _Paths.TOURORDER,
      page: () => TourOrderView(),
      binding: TourOrderBinding(),
    ),       
    GetPage(
      name: _Paths.TOURORDERROW,
      page: () => TourOrderRowView(),
      binding: TourOrderRowBinding(),
    ),     
    GetPage(
      name: _Paths.TOURORDERROWPICKUP,
      page: () => TourOrderRowPickupView(),
      binding: TourOrderRowPickupBinding(),
    ),                
    GetPage(
      name: _Paths.SCANNER,
      page: () => ScannerView(),
      binding: ScannerBinding(),
    ),             
    GetPage(
      name: _Paths.MCIF,
      page: () => LandingView(),
      binding: LandingBinding(),
    ),             
  ];
}
