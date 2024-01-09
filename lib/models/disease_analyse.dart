class DiseaseAnalyzes {
  int? id;
  int? medicalCenterId;
  int? personId;
  String? analysisAppointment;
  String? analysisDate;
  bool? analysisResult;
  String? notes;

  DiseaseAnalyzes(
      {this.id,
      this.medicalCenterId,
      this.personId,
      this.analysisAppointment,
      this.analysisDate,
      this.analysisResult,
      this.notes});

  DiseaseAnalyzes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    medicalCenterId = json['medicalCenterId'];
    personId = json['personId'];
    analysisAppointment = json['analysisAppointment'];
    analysisDate = json['analysisDate'];
    analysisResult = json['analysisResult'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['medicalCenterId'] = this.medicalCenterId;
    data['personId'] = this.personId;
    data['analysisAppointment'] = this.analysisAppointment;
    data['analysisDate'] = this.analysisDate;
    data['analysisResult'] = this.analysisResult;
    data['notes'] = this.notes;
    return data;
  }
}
