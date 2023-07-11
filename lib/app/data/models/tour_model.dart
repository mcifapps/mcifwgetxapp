class TourModel {
  int?    emp_tra_id;
  String? emp_tra_vector;
  String? emp_tra_date_tour;

  TourModel({
    this.emp_tra_id,
    this.emp_tra_vector,
    this.emp_tra_date_tour,
  });

  TourModel.fromJson(Map<String, dynamic> json) {
    emp_tra_id          = json['emp_tra_id'];
    emp_tra_vector      = json['emp_tra_vector'];
    emp_tra_date_tour   = json['emp_tra_date_tour'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['emp_tra_id']        = emp_tra_id;
    data['emp_tra_vector']    = emp_tra_vector;
    data['emp_tra_date_tour'] = emp_tra_date_tour;
    return data;
  }
}
