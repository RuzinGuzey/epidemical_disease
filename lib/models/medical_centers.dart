class MedicalCenters {
  int? id;
  String? code;
  String? name;
  String? city;
  String? region;

  MedicalCenters({this.id, this.code, this.name, this.city, this.region});

  MedicalCenters.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    city = json['city'];
    region = json['region'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['city'] = this.city;
    data['region'] = this.region;
    return data;
  }
}
