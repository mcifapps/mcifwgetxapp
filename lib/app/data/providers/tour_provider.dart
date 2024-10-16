//import 'dart:convert';

import 'package:get/get.dart';
import 'package:mcifwgetxapp/app/utils/constants.dart';

import 'package:mcifwgetxapp/app/data/models/tour_model.dart';
import 'package:mcifwgetxapp/app/data/models/tour_order_model.dart';
import 'package:mcifwgetxapp/app/data/models/tour_order_row_model.dart';

import 'package:mcifwgetxapp/app/data/models/scanner_message_model.dart';

import 'dart:convert';

import 'package:http/http.dart' show Client;

class TourProvider extends GetConnect {

  Client client = Client();

  Future<List<TourModel>> getTours() async {
    var httpsUri = Uri(
            scheme:   URL_SCHEME,
            host:     URL_HOST,
            path:     URL_PREFIX + '/delivery/empDetailsFA.php'
    );

    final response = await client.get(httpsUri);

    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<TourModel> tours = items.map<TourModel>((json) {
      return TourModel.fromJson(json);
    }).toList();

    return tours;
  }  

  Future<List<TourOrderModel>> getTourOrders(int iTour) async {
    var httpsUri = Uri(
            scheme:   URL_SCHEME,
            host:     URL_HOST,
            path:     URL_PREFIX + '/order/empDetailsFA.php'
    );

    final response = await client.post(
      httpsUri,
      body: {
        //'id': widget.student!.id.toString(), // devo passare il parametro
        'id': iTour.toString(),
      },
    );

    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<TourOrderModel> tourorders = items.map<TourOrderModel>((json) {
      return TourOrderModel.fromJson(json);
    }).toList();

    return tourorders;
  }  

  Future<List<TourOrderRowModel>> getTourOrderRows(int iTourOrder) async {
    var httpsUri = Uri(
            scheme:   URL_SCHEME,
            host:     URL_HOST,
            path:     URL_PREFIX + '/order_rows/empDetailsFA.php'
    );

    final response = await client.post(
      httpsUri,
      body: {
        //'id': widget.student!.id.toString(), // devo passare il parametro
        'id': iTourOrder.toString(),
      },
    );

    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<TourOrderRowModel> tourorders = items.map<TourOrderRowModel>((json) {
      return TourOrderRowModel.fromJson(json);
    }).toList();

    return tourorders;
  }  

  Future<List<TourOrderRowModel>> getTourOrderRowsBarcode(int iTourOrderRow, String sBarcode) async {
    var httpsUri = Uri(
            scheme:   URL_SCHEME,
            host:     URL_HOST,
            path:     URL_PREFIX + '/order_rows/empDetailsBarcodeFA.php'
    );

    final response = await client.post(
      httpsUri,
      body: {
        //'id': widget.student!.id.toString(), // devo passare il parametro
        'id': iTourOrderRow.toString(),
        'barcode': sBarcode,
      },
    );

    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<TourOrderRowModel> tourorders = items.map<TourOrderRowModel>((json) {
      return TourOrderRowModel.fromJson(json);
    }).toList();

    return tourorders;
  }  

  //qui bisogna aggiungere la funzione getTourOrderRowsPickupWithBar che prende in input il barcode da ricercare su tutto l'ordine e restituire la riga
  Future<List<TourOrderRowModel>> getTourOrderRowsPickupWithBar(int iTourOrderRowBar, int iTourOrder) async {
    var httpsUri = Uri(
            scheme:   URL_SCHEME,
            host:     URL_HOST,
            path:     URL_PREFIX + '/order_rows/empDetailsPickupBarcodeFA.php'
    );

    final response = await client.post(
      httpsUri,
      body: {
        //'id': widget.student!.id.toString(), // devo passare il parametro
        'id': iTourOrderRowBar.toString(),
        'nm': iTourOrder.toString(),
      },
    );

    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<TourOrderRowModel> tourorders = items.map<TourOrderRowModel>((json) {
      return TourOrderRowModel.fromJson(json);
    }).toList();

    return tourorders;
  }  

  Future<List<TourOrderRowModel>> getTourOrderRowsPickup(int iTourOrderRow) async {
    var httpsUri = Uri(
            scheme:   URL_SCHEME,
            host:     URL_HOST,
            path:     URL_PREFIX + '/order_rows/empDetailsPickupFA.php'
    );

    final response = await client.post(
      httpsUri,
      body: {
        //'id': widget.student!.id.toString(), // devo passare il parametro
        'id': iTourOrderRow.toString(),
      },
    );

    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<TourOrderRowModel> tourorders = items.map<TourOrderRowModel>((json) {
      return TourOrderRowModel.fromJson(json);
    }).toList();

    return tourorders;
  }  

  Future<List<ScannerMessageModel>> setTourOrderRowPickupFromBarcode(String ord_h_number, String ord_r_id) async {

    var httpsUri = Uri(
            scheme:   URL_SCHEME,
            host:     URL_HOST,
            path:     URL_PREFIX + '/order_rows/updateRowPickupFromBarcodeFA.php');

    final response = await client.post(
      httpsUri,
      body: {
        "ord_h_number": ord_h_number,
        "ord_r_id":     ord_r_id
      },
    );

    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<ScannerMessageModel> messages = items.map<ScannerMessageModel>((json) {
      return ScannerMessageModel.fromJson(json);
    }).toList();

    return messages;
  }

}
