class TourOrderRowModel {
  int?    ord_r_number;
  String? ord_r_code;
  String? ord_r_aticle;
  int?    ord_r_qtaord;
  String? ord_r_flag_status;
  String? ord_r_status;
  int?    ord_r_id;
  String? mcs_ana_barcode1;
  String? mcs_ana_checkbc;
  int?    ord_h_tra_id;

  TourOrderRowModel({
    this.ord_r_number,
    this.ord_r_code,
    this.ord_r_aticle,
    this.ord_r_qtaord,
    this.ord_r_flag_status,
    this.ord_r_status,
    this.ord_r_id,
    this.mcs_ana_barcode1,    
    this.mcs_ana_checkbc,    
    this.ord_h_tra_id,    
  });

  TourOrderRowModel.fromJson(Map<String, dynamic> json) {
    ord_r_number      = json['ord_r_number'];
    ord_r_code        = json['ord_r_code'];
    ord_r_aticle      = json['ord_r_aticle'];
    ord_r_qtaord      = json['ord_r_qtaord'];
    ord_r_flag_status = json['ord_r_flag_status'];
    ord_r_status      = json['ord_r_status'];
    ord_r_id          = json['ord_r_id'];
    mcs_ana_barcode1  = json['mcs_ana_barcode1'];
    mcs_ana_checkbc   = json['mcs_ana_checkbc'];
    ord_h_tra_id      = json['ord_h_tra_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['ord_h_number']      = ord_r_number;
    data['ord_r_code']        = ord_r_code;
    data['ord_r_aticle']      = ord_r_aticle;
    data['ord_r_qtaord']      = ord_r_qtaord;
    data['ord_r_flag_status'] = ord_r_flag_status;
    data['ord_r_status']      = ord_r_status;
    data['ord_r_id']          = ord_r_id;
    data['mcs_ana_barcode1']  = mcs_ana_barcode1;
    data['mcs_ana_checkbc']   = mcs_ana_checkbc;
    data['ord_h_tra_id']      = ord_h_tra_id;

    return data;
  }
}
