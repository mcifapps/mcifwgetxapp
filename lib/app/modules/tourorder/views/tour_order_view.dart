//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcifwgetxapp/app/modules/tourorder/controllers/tour_order_controller.dart';
import 'package:mcifwgetxapp/app/routes/app_pages.dart';
//import 'package:mcifwgetxapp/app/routes/app_pages.dart';
import 'package:mcifwgetxapp/app/themes/app_text_theme.dart';
import 'package:mcifwgetxapp/app/themes/theme_colors.dart';
//import 'package:mcifwgetxapp/app/utils/constants.dart';

class TourOrderView extends GetView<TourOrderController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColor.primaryGrey,
          title: Text(
            'Ordini da evadere',
            style: poppinsBold(),
          ),
          elevation: 0,
        ),
        body: controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.tourorders.length,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.TOURORDERROW, arguments: {
                          'ord_h_number': controller.tourorders[index].ord_h_number
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
                            //  //    '$imageBaseUrl${controller.tourorders[index].backdropPath}',
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
                                              (controller.tourorders[index].ord_h_load.toString() == '*') ? Icon(Icons.access_time) : (
                                                (controller.tourorders[index].ord_h_load.toString() == '***') ? Icon(Icons.drive_eta) : Text("")
                                              ),
                                            ],
                                          ),   
                                trailing: Icon(Icons.view_list),
                                title: Text(
                                  controller.tourorders[index].ord_h_number.toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                                subtitle: Text(
                                  controller.tourorders[index].ord_h_client.toString(),
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),                            
                            
                            //Text(
                            //  controller.tourorders[index].ord_h_number.toString(),
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
