class TourOrderModel {
  int?    ord_h_number;
  String? ord_h_code;
  String? ord_h_client;
  String? ord_h_load;

  TourOrderModel({
    this.ord_h_number,
    this.ord_h_code,
    this.ord_h_client,
    this.ord_h_load,
  });

  TourOrderModel.fromJson(Map<String, dynamic> json) {
    ord_h_number = json['ord_h_number'];
    ord_h_code   = json['ord_h_code'];
    ord_h_client = json['ord_h_client'];
    ord_h_load   = json['ord_h_load'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ord_h_number']  = ord_h_number;
    data['ord_h_code']    = ord_h_code;
    data['ord_h_client']  = ord_h_client;
    data['ord_h_load']    = ord_h_load;
    return data;
  }
}
