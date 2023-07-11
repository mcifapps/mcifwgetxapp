class ProductDrillDownModel {
  String? mcs_ana_find;
  String? mcs_ana_idx;

  ProductDrillDownModel({
    this.mcs_ana_find,
    this.mcs_ana_idx,
  });

  ProductDrillDownModel.fromJson(Map<String, dynamic> json) {
    mcs_ana_find  = json['mcs_ana_find'];
    mcs_ana_idx   = json['mcs_ana_idx'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['mcs_ana_find'] = mcs_ana_find;
    data['mcs_ana_idx']  = mcs_ana_idx;
    return data;
  }
}
