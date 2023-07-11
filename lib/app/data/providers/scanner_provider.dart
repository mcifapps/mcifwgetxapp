//import 'dart:convert';

import 'package:get/get.dart';
import 'package:mcifwgetxapp/app/data/models/scanner_message_model.dart';
import 'package:mcifwgetxapp/app/utils/constants.dart';

import 'package:mcifwgetxapp/app/data/models/scanner_model.dart';
import 'package:mcifwgetxapp/app/data/models/product_drilldown_model.dart';

import 'dart:convert';

import 'package:http/http.dart' show Client;

class ScannerProvider extends GetConnect {

  Client client = Client();

  Future<List<ScannerModel>> getScanners(String iBarcode) async {
    var httpsUri = Uri(
            scheme:   URL_SCHEME,
            host:     URL_HOST,
            path:     URL_PREFIX + '/___common/barDetailsFA.php'
    );

    final response = await client.post(
      httpsUri,
      body: {
        //'id': widget.student!.id.toString(), // devo passare il parametro
        'id': iBarcode,
      },
    );

    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<ScannerModel> scanners = items.map<ScannerModel>((json) {
      return ScannerModel.fromJson(json);
    }).toList();

    return scanners;
  }  

  Future<List<ProductDrillDownModel>> getProductDrillDownModelList() async {
    var httpsUri = Uri(
            scheme:   URL_SCHEME,
            host:     URL_HOST,
            path:     URL_PREFIX + '/___common/barProductsMapFA.php');

    final response = await client.get(
      httpsUri,
    );

    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<ProductDrillDownModel> products = items.map<ProductDrillDownModel>((json) {
      return ProductDrillDownModel.fromJson(json);
    }).toList();

    return products;
  }

  Future<List<ScannerMessageModel>> setProductFromBarcode(String iBarcode, String iArticle) async {

    var httpsUri = Uri(
            scheme:   URL_SCHEME,
            host:     URL_HOST,
            path:     URL_PREFIX + '/___common/updateBarDetailsFA.php');

    final response = await client.post(
      httpsUri,
      body: {
        "id": iBarcode,
        "article": iArticle
      },
    );

    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<ScannerMessageModel> messages = items.map<ScannerMessageModel>((json) {
      return ScannerMessageModel.fromJson(json);
    }).toList();

    return messages;
  }

}
