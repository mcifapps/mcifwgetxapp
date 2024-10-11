//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:mcifwgetxapp/app/modules/tourorder/controllers/tour_order_controller.dart';
//import 'package:mcifwgetxapp/app/modules/tourorderrow/controllers/tour_order_row_controller.dart';
import 'package:mcifwgetxapp/app/modules/tourorderrowpickup/controllers/tour_order_row_pickup_controller.dart';
import 'package:mcifwgetxapp/app/routes/app_pages.dart';
import 'package:mcifwgetxapp/app/themes/app_text_theme.dart';
import 'package:mcifwgetxapp/app/themes/theme_colors.dart';
//import 'package:mcifwgetxapp/app/utils/constants.dart';
//import 'package:mcifwgetxapp/app/routes/app_pages.dart';

//import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class TourOrderRowPickupView extends GetView<TourOrderRowPickupController> {

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColor.primaryGrey,
          title: Text(
            'Conferma prelievo',
            style: poppinsBold(),
          ),
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_upward),
              //tooltip: 'Show Snackbar',
              onPressed: () {
                //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //    content: Text('This is a Appbar Icon example')));

                Get.offAndToNamed(Routes.TOURORDERROW, arguments: {
                  'ord_h_number': controller.ordId,
                  'ord_r_id': 0,
                  'ord_h_tra_id': controller.traId,
                });                    
              },
            ),
          ]
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
                      onTap: () {
                        print("");
                      },
                      child: Stack(
                        //alignment: Alignment.bottomLeft,
                        alignment: Alignment.bottomCenter,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(6.0),
                            ),
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

                          Column(
                            children: <Widget>[
                            Padding(
                            padding: const EdgeInsets.all(10.0),
                            child:
                              Text(
                                "Barcode:" + controller.tourorderrows[index].mcs_ana_barcode1.toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Padding(
                            padding: const EdgeInsets.all(10.0),
                            child:
                              Text(
                                "Codice:" + controller.tourorderrows[index].ord_r_code.toString(),
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            Padding(
                            padding: const EdgeInsets.all(10.0),
                            child:
                              Text(
                                controller.tourorderrows[index].ord_r_aticle.toString(),
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            Padding(
                            padding: const EdgeInsets.all(10.0),
                            child:
                              Text(
                                "Qta. " + controller.tourorderrows[index].ord_r_qtaord.toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                              child: 
                                 ElevatedButton(
                                  child: controller.tourorderrows[index].ord_r_number==0 ? Text('Indietro') : Text('Preleva'),
                                  //color: Colors.blue,
                                  //textColor: Colors.white,
                                  onPressed: () {
                                      //_onConfirm(context, widget.mcs_ana_insertedbc, widget.mcs_ana_code);
                                      if(controller.tourorderrows[index].ord_r_number!=0) {
                                        controller.onConfirmSetPickup(
                                            controller.tourorderrows[index].ord_r_number.toString(), 
                                            controller.tourorderrows[index].ord_r_id.toString(),
                                        );
                                      }

                                      Get.offAndToNamed(Routes.TOURORDERROW, arguments: {
                                        'ord_h_number': controller.ordId,
                                        'ord_r_id': 0,
                                        'ord_h_tra_id': controller.traId,
                                      });               

                                  },
                                  //style: style,
                                ),         
                            ),             
                            
                            ]
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
