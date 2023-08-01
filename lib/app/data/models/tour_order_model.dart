class TourOrderModel {
  int?    ord_h_number;
  String? ord_h_code;
  String? ord_h_client;
  String? ord_h_load;
  int?    ord_h_tra_id;

  TourOrderModel({
    this.ord_h_number,
    this.ord_h_code,
    this.ord_h_client,
    this.ord_h_load,
    this.ord_h_tra_id,
  });

  TourOrderModel.fromJson(Map<String, dynamic> json) {
    ord_h_number = json['ord_h_number'];
    ord_h_code   = json['ord_h_code'];
    ord_h_client = json['ord_h_client'];
    ord_h_load   = json['ord_h_load'];
    ord_h_tra_id = json['ord_h_tra_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ord_h_number']  = ord_h_number;
    data['ord_h_code']    = ord_h_code;
    data['ord_h_client']  = ord_h_client;
    data['ord_h_load']    = ord_h_load;
    data['ord_h_tra_id']  = ord_h_tra_id;
    return data;
  }
}
