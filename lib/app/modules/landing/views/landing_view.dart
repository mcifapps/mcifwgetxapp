//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcifwgetxapp/app/modules/landing/controllers/landing_controller.dart';
import 'package:mcifwgetxapp/app/routes/app_pages.dart';
import 'package:mcifwgetxapp/app/themes/app_text_theme.dart';
import 'package:mcifwgetxapp/app/themes/theme_colors.dart';
//import 'package:mcifwgetxapp/app/utils/constants.dart';
//import 'package:mcifwgetxapp/app/widgets/navigation_drawer.dart';

import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

// ignore: must_be_immutable
class LandingView extends GetView<LandingController> {

  String result = '';

  @override
  Widget build(BuildContext context) {

    //var navigationDrawer = new NavigationDrawer();
    
    //return Obx( // se non usi oggetti osservabili del controller non serve, altrimenti serve 
    //  () => 
      
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColor.primaryGrey,
          title: Text(
            'Home',
            style: poppinsBold(),
          ),
          elevation: 0,
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
        body: Center(
          child: Column(
            children: <Widget>[
              Text("_"),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(94, 95, 95, 0), elevation: 0),
                onPressed: () => Get.toNamed(Routes.TOUR), 
                //child: Text("Giri di consegna")
                child: Image.asset('assets/images/tour.png', fit: BoxFit.cover, width:200, height: 200,),
                ),
              //Image.asset('assets/images/tour.png'),
              /*
              Text("_"),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(94, 95, 95, 0), elevation: 0),
                onPressed: () => Get.toNamed(Routes.SCANNER, arguments: {
                          'mcs_ana_insertedbc': '9000000000001'
                        }),
                //child: Text("Scansiona prodotto")
                child: Image.asset('assets/images/scanner.png', fit: BoxFit.cover, width:200, height: 200,),
                ),
              */


                Text("_"),
                ElevatedButton(
                  onPressed: () async {
                    var res = await Navigator.push(
                        context,

                        MaterialPageRoute(
                            builder: (context) => const SimpleBarcodeScannerPage(),
                        ));

//                        setState(() {
                        if (res is String) {
                            result = res;
                            var param1 = result.toString();
                            //var param2 = "param2";
                            Get.toNamed(Routes.SCANNER, arguments: {
                                // 'mcs_ana_insertedbc': '9000000000001'
                                'mcs_ana_insertedbc': param1
                          });
                        }
//                        });
                  },
                  child: Image.asset('assets/images/scanner.png', fit: BoxFit.cover, width:200, height: 200,),
                  style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(94, 95, 95, 0), elevation: 0),
                ),

              //Image.asset('assets/images/scanner.png'),
            ],
          ),
        )
      );
//    );
  }
}
