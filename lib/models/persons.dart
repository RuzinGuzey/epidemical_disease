class Persons {
  int? id;
  int? tc;
  String? firstName;
  String? surName;
  String? city;
  String? region;

  Persons(
      {this.id, this.tc, this.firstName, this.surName, this.city, this.region});

  Persons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tc = json['tc'];
    firstName = json['firstName'];
    surName = json['surName'];
    city = json['city'];
    region = json['region'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tc'] = this.tc;
    data['firstName'] = this.firstName;
    data['surName'] = this.surName;
    data['city'] = this.city;
    data['region'] = this.region;
    return data;
  }
}