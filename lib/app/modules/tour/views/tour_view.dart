//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcifwgetxapp/app/modules/tour/controllers/tour_controller.dart';
import 'package:mcifwgetxapp/app/routes/app_pages.dart';
import 'package:mcifwgetxapp/app/themes/app_text_theme.dart';
import 'package:mcifwgetxapp/app/themes/theme_colors.dart';
//import 'package:mcifwgetxapp/app/utils/constants.dart';
//import 'package:mcifwgetxapp/app/widgets/navigation_drawer.dart';

class TourView extends GetView<TourController> {

  @override
  Widget build(BuildContext context) {

    //controller.fetchTours(); // funziona ma non subito, solo alla seconda chiamata

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColor.primaryGrey,
          title: Text(
            'Giri di consegna',
            style: poppinsBold(),
          ),
          elevation: 0,
          actions: <Widget>[],                  
        ),
        //drawer: return NavigationDrawer(),
        /*
        drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Get.toNamed(Routes.MCIF, arguments: {});
              }
            ),
            ListTile(
              title: const Text('Giri di consegna'),
              onTap: () {
                Get.toNamed(Routes.TOUR, arguments: {});
              }
            ),
          ],
        ),
      ),
      */
        body: 
          controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.tours.length,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    //controller.update(); //provo a fare un aggiornamento forzato da qui quando passo dal Drawer
                    return GestureDetector(
                      onTap: () {
                        Get.offAndToNamed(Routes.TOURORDER, arguments: {
                          'emp_tra_id': controller.tours[index].emp_tra_id
                        });
                      },
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(6.0),
                            ),
                            //child: CachedNetworkImage(
                            //  //imageUrl:
                            //  //    '$imageBaseUrl${controller.tours[index].backdropPath}',
                            //  fit: BoxFit.cover,
                            //  height: Get.height * 0.28,
                            //  width: Get.width,
                            //  errorWidget: (context, url, error) =>
                            //      const Icon(Icons.error),
                            //),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: Get.height * 0.15,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(6.0),
                                  bottomRight: Radius.circular(6.0),
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.25),
                                    Colors.transparent
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child:

                              ListTile(
                                leading:  Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              (controller.tours[index].emp_tra_load.toString() == '*') ? Icon(Icons.access_time) : (
                                                (controller.tours[index].emp_tra_load.toString() == '***') ? Icon(Icons.drive_eta) : Text("")
                                              ),
                                            ],
                                          ),   
                                trailing: Icon(Icons.view_list),
                                title: Text(
                                  controller.tours[index].emp_tra_date_tour.toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                                subtitle: Text(
                                  "Giro:" + controller.tours[index].emp_tra_id.toString() + " - Zona:" + controller.tours[index].emp_tra_zone.toString(),
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),

                            //Text(
                            //  controller.tours[index].emp_tra_date_tour.toString(),
                            //  style: poppinsBold(color: ThemeColor.white),
                            //  overflow: TextOverflow.ellipsis,
                            //),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 10);
                  },
                ),
              ),
      ),
    );
  }
}
