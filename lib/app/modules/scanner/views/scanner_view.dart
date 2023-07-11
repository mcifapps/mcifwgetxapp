//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcifwgetxapp/app/modules/scanner/controllers/scanner_controller.dart';
import 'package:mcifwgetxapp/app/routes/app_pages.dart';
import 'package:mcifwgetxapp/app/themes/app_text_theme.dart';
import 'package:mcifwgetxapp/app/themes/theme_colors.dart';
//import 'package:mcifwgetxapp/app/utils/constants.dart';
//import 'package:mcifwgetxapp/app/widgets/navigation_drawer.dart';

import 'package:select_searchable_list/select_searchable_list.dart';

class ScannerView extends GetView<ScannerController> {

  @override
  Widget build(BuildContext context) {

    //controller.fetchScanners(); // funziona ma non subito, solo alla seconda chiamata

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColor.primaryGrey,
          title: Text(
            'Scannerizzazione barcode',
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
        /*
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            //key: controller.loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: controller.mcs_ana_insertedbc_c,
                  decoration: const InputDecoration(labelText: 'Barcode'),
                  //validator: controller.validator,
                ),
                TextFormField(
                  controller: controller.mcs_ana_code_c,
                  decoration: const InputDecoration(labelText: 'Articolo'),
                  //validator: controller.validator,
                  //obscureText: true,
                ),
                //ElevatedButton(
                //  child: Text('Login'),
                //  onPressed: controller.login,
                //)
              ],
            ),
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
                  itemCount: controller.scanners.length,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    //controller.update(); //provo a fare un aggiornamento forzato da qui quando passo dal Drawer
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.TOURORDER, arguments: {
                          'mcs_ana_code': controller.scanners[index].mcs_ana_code
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
                            //  //    '$imageBaseUrl${controller.scanners[index].backdropPath}',
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


                          Column(
                            children: <Widget>[
                            Padding(
                            padding: const EdgeInsets.all(10.0),
                            child:
                              TextFormField(
                                controller: controller.mcs_ana_insertedbc_c,
                                //controller: TextEditingController(text: controller.scanners[index].mcs_ana_insertedbc.toString()),
                                decoration: const InputDecoration(labelText: 'Barcode'),
                                //validator: controller.validator,
                              ),
                            ),
                            Padding(
                            padding: const EdgeInsets.all(10.0),
                            child:

                              DropDownTextField(
                                textEditingController: controller.mcs_ana_code_c,
                                //title: 'Category',
                                hint: 'Seleziona articolo',
                                options: controller.mapProductsForDrillDown, //
                                //selectedOptions: _selectedCategoryValue,
                                decoration: InputDecoration(labelText: 'Articolo'),   
                                style: TextStyle(color: Colors.black,fontSize: 12),
                                onChanged: (selectedIds) {
                                  //setState(() => selectedIds); // a cosa serve impostare lo stato
                                  print(selectedIds);
                                },
                                // style: const TextStyle(
                                //   fontSize: 16.0,
                                //   color: Colors.red,
                                // ),
                              ),

                            
                              /*
                              TextFormField(
                                controller: controller.mcs_ana_code_c,
                                //controller: TextEditingController(text: controller.scanners[index].mcs_ana_code.toString()),
                                decoration: const InputDecoration(labelText: 'Articolo'),
                                style: TextStyle(color: Colors.black,fontSize: 10),
                                //validator: controller.validator,
                              ),
                              */
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                              child: 
                                ElevatedButton(
                                  child: Text('Salva'),
                                  //color: Colors.blue,
                                  //textColor: Colors.white,
                                  onPressed: () {
                                      //_onConfirm(context, widget.mcs_ana_insertedbc, widget.mcs_ana_code);
                                      controller.onConfirmSetProductFromBarcode(controller.mcs_ana_insertedbc_c, controller.mcs_ana_code_c);

                                      final snackBar = SnackBar(
                                        content: const Text('Barcode associato.'),
                                        action: SnackBarAction(
                                          label: 'Chiudi',
                                          onPressed: () {
                                            // Some code to undo the change.
                                          },
                                        ),
                                      );
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                  },
                                  //style: style,
                                ),         
                            ),                            
                            
                            ]
                          ),


                          /*
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child:

                              ListTile(
                                leading:  Icon(Icons.barcode_reader),
                                trailing: Icon(Icons.view_list),
                                title: Text(
                                  controller.scanners[index].mcs_ana_insertedbc.toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                                subtitle: Text(
                                  controller.scanners[index].mcs_ana_code.toString(),
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            //Text(
                            //  controller.scanners[index].mcs_ana_insertedbc.toString(),
                            //  style: poppinsBold(color: ThemeColor.white),
                            //  overflow: TextOverflow.ellipsis,
                            //),
                          ),
*/
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
