import 'package:get/get.dart';
//import 'package:imdb_movie_app/app/data/models/tour_model.dart';
//import 'package:imdb_movie_app/app/data/providers/tour_provider.dart';

class LandingController extends GetxController {
  //final TourProvider tourProvider = Get.find<TourProvider>();
  //RxList<TourModel> tours = <TourModel>[].obs;
  RxBool isLoading = true.obs;
  RxBool enableButton = true.obs;

  @override
  void onReady() {
    super.onReady();
    //fetchTours();

    isLoading.value = false;
  }

  /*
  void fetchTours() async {

    var results = await tourProvider.getTours();

    // ignore: unnecessary_null_comparison
    if (results != null) {
      results.forEach((result) {
        tours.add(result);
      });
    }
    isLoading.value = false;
  }
  */

}
