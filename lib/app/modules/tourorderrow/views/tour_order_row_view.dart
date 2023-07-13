//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:mcifwgetxapp/app/modules/tourorder/controllers/tour_order_controller.dart';
import 'package:mcifwgetxapp/app/modules/tourorderrow/controllers/tour_order_row_controller.dart';
//import 'package:mcifwgetxapp/app/routes/app_pages.dart';
import 'package:mcifwgetxapp/app/themes/app_text_theme.dart';
import 'package:mcifwgetxapp/app/themes/theme_colors.dart';
//import 'package:mcifwgetxapp/app/utils/constants.dart';
//import 'package:mcifwgetxapp/app/routes/app_pages.dart';

class TourOrderRowView extends GetView<TourOrderRowController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColor.primaryGrey,
          title: Text(
            'Dettaglio ordine',
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
                  itemCount: controller.tourorderrows.length,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      //onTap: () {
                      //  Get.toNamed(Routes.DETAILS, arguments: {
                      //    'emp_tra_id': controller.tourorderrows[index].emp_tra_id
                      //  });
                      //},
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(6.0),
                            ),
                            //child: CachedNetworkImage(
                            //  //imageUrl:
                            //  //    '$imageBaseUrl${controller.tourorderrows[index].backdropPath}',
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
                                //leading:  Icon(Icons.content_paste),
                                leading: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              (controller.tourorderrows[index].mcs_ana_barcode1.toString() != '0') ? Icon(Icons.barcode_reader) : Icon(Icons.lock),
                                            ],
                                          ),                                          
                                trailing: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Qta. " + controller.tourorderrows[index].ord_r_qtaord.toString(),
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              //( controller.tourorderrows[index].ord_r_flag_status.toString() == 'FOS') ? Text("") : Text(""),
                                              ( controller.tourorderrows[index].ord_r_flag_status.toString() == 'DEL') ? Icon(Icons.clear) : (
                                                ( controller.tourorderrows[index].ord_r_flag_status.toString() == 'STR') ? Icon(Icons.access_time) : (
                                                  ( controller.tourorderrows[index].ord_r_flag_status.toString() == 'CAR') ? Icon(Icons.done) : Text("")
                                                )
                                              ),                                                                                            
                                                //( controller.tourorderrows[index].ord_r_flag_status.toString() == 'CAR') ? Icon(Icons.done) : Text(""),                                              
                                            ],
                                          ),
                                title:    Text(
                                            controller.tourorderrows[index].ord_r_code.toString(),
                                            style: TextStyle(fontSize: 14),
                                          ),
                                subtitle: Text(
                                            controller.tourorderrows[index].ord_r_aticle.toString(),
                                            style: TextStyle(fontSize: 12),
                                          ), 
                              ),                            
                            
                            //Text(
                            //  controller.tourorderrows[index].ord_h_number.toString(),
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
