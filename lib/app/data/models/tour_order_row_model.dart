class TourOrderRowModel {
  int?    ord_r_number;
  String? ord_r_code;
  String? ord_r_aticle;
  int?    ord_r_qtaord;
  String? ord_r_flag_status;
  String? ord_r_status;

  TourOrderRowModel({
    this.ord_r_number,
    this.ord_r_code,
    this.ord_r_aticle,
    this.ord_r_qtaord,
    this.ord_r_flag_status,
    this.ord_r_status,
  });

  TourOrderRowModel.fromJson(Map<String, dynamic> json) {
    ord_r_number      = json['ord_r_number'];
    ord_r_code        = json['ord_r_code'];
    ord_r_aticle      = json['ord_r_aticle'];
    ord_r_qtaord      = json['ord_r_qtaord'];
    ord_r_flag_status = json['ord_r_flag_status'];
    ord_r_status      = json['ord_r_status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['ord_h_number']      = ord_r_number;
    data['ord_r_code']        = ord_r_code;
    data['ord_r_aticle']      = ord_r_aticle;
    data['ord_r_qtaord']      = ord_r_qtaord;
    data['ord_r_flag_status'] = ord_r_flag_status;
    data['ord_r_status']      = ord_r_status;

    return data;
  }
}
