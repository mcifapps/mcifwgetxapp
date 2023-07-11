class ScannerMessageModel {
  String? mcs_ana_code;
  String? mcs_ana_desc;

  ScannerMessageModel({
    this.mcs_ana_code,
    this.mcs_ana_desc,
  });

  ScannerMessageModel.fromJson(Map<String, dynamic> json) {
    mcs_ana_code        = json['mcs_ana_code'];
    mcs_ana_desc        = json['mcs_ana_desc'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['mcs_ana_code']       = mcs_ana_code;
    data['mcs_ana_desc']       = mcs_ana_desc;
    return data;
  }
}
