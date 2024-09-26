class StateModel {
  String? state;
  int? id;

  StateModel({this.state, this.id});

  StateModel.fromJson(Map<String, dynamic> json) {
    state = json['STATE'];
    id = json['ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['STATE'] = this.state;
    data['ID'] = this.id;
    return data;
  }
}
