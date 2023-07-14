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

import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class TourOrderRowView extends GetView<TourOrderRowController> {

  Future<void> _showMyDialog(BuildContext context, String sTitle, String sBody, String sButton) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        print(sTitle);
        print(sBody);
        print(sButton);
        return AlertDialog(
          title: new Text(sTitle),
          content: new Text(sBody),
          actions: <Widget>[
            TextButton(
              child: new Text(sButton),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showMyScanner(BuildContext context, String ord_r_id, String mcs_ana_barcode1) async {

    String result = '';

    var res = await Navigator.push(
        context,

        MaterialPageRoute(
            builder: (context) => const SimpleBarcodeScannerPage(),
        ));

        if (res is String) {
            result = res;
            var param1 = result.toString();
            var param2 = ord_r_id.toString();
            var param3 = mcs_ana_barcode1.toString();
            //
            print(param1);
            print(param2);
            print(param3);

            (param1 == param3) 
            ? 
            _showMyDialog(context, 'Corretto!','Verifica barcode effettuata con successo.','Procedi!')

            //qui possiamo andare sulla pagina che ci permette la conferma della quantità da prelevare
            : 
            _showMyDialog(context, 'Errore','Il barcode ' + param1 + ' non coincide con il barcode del prodotto ' + param3 + '.','Annulla!');

            //Get.toNamed(Routes.SCANNER, arguments: {
            //    // 'mcs_ana_insertedbc': '9000000000001'
            //    'mcs_ana_insertedbc': param1
            //});
        }
  }

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
                      onTap: () {
                      //  Get.toNamed(Routes.DETAILS, arguments: {
                      //    'emp_tra_id': controller.tourorderrows[index].emp_tra_id
                      //  });
                        // ignore: unused_local_variable
                        (controller.tourorderrows[index].mcs_ana_barcode1.toString() != '0') ? 
                        {
                        //print(controller.tourorderrows[index].ord_r_id.toString()) 
                        _showMyScanner(context, controller.tourorderrows[index].ord_r_id.toString(), controller.tourorderrows[index].mcs_ana_barcode1.toString())
                        }
                        : 
                        { 
                        //print("")
                        _showMyDialog(context, 'Attenzione','Articolo senza barcode, censirlo in anagrafica.','Ho capito!')
                        };
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
