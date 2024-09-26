class StateModel {
  String? sTATE;
  int? iD;

  StateModel({this.sTATE, this.iD});

  StateModel.fromJson(Map<String, dynamic> json) {
    sTATE = json['STATE'];
    iD = json['ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['STATE'] = this.sTATE;
    data['ID'] = this.iD;
    return data;
  }
}