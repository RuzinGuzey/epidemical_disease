class Vaccines {
  int? id;
  int? medicalCenterId;
  int? vaccineTypeId;
  int? personId;
  String? appointmentDate;
  String? vaccineDate;
  String? notes;

  Vaccines(
      {this.id,
      this.medicalCenterId,
      this.vaccineTypeId,
      this.personId,
      this.appointmentDate,
      this.vaccineDate,
      this.notes});

  Vaccines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    medicalCenterId = json['medicalCenterId'];
    vaccineTypeId = json['vaccineTypeId'];
    personId = json['personId'];
    appointmentDate = json['appointmentDate'];
    vaccineDate = json['vaccineDate'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['medicalCenterId'] = this.medicalCenterId;
    data['vaccineTypeId'] = this.vaccineTypeId;
    data['personId'] = this.personId;
    data['appointmentDate'] = this.appointmentDate;
    data['vaccineDate'] = this.vaccineDate;
    data['notes'] = this.notes;
    return data;
  }
}
