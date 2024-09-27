class DistrictModel {
  int? id;
  String? districtName;

  DistrictModel({this.id, this.districtName});

  DistrictModel.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    districtName = json['DISTRICT_NAME'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = id;
    data['DISTRICT_NAME'] = districtName;
    return data;
  }
}
