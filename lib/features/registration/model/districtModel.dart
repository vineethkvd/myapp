class DistrictModel {
  int? iD;
  String? dISTRICTNAME;

  DistrictModel({this.iD, this.dISTRICTNAME});

  DistrictModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    dISTRICTNAME = json['DISTRICT_NAME'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['DISTRICT_NAME'] = this.dISTRICTNAME;
    return data;
  }
}
