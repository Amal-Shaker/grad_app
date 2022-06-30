class Vaccination {
  int? vacc_id;
  String? vacc_place;
  String? vacc_date;
  String? vacc_time;
  int? haj_id;

  Vaccination(
      {this.vacc_id,
      this.haj_id,
      this.vacc_date,
      this.vacc_place,
      this.vacc_time});

  toMap() {
    return {
      'vacc_id': vacc_id,
      'vacc_place': vacc_place,
      'vac_date': vacc_date,
      'vacc_time': vacc_time,
      'haj_id': haj_id
    };
  }

  Vaccination.fromJson(Map<String, dynamic> json) {
    vacc_id = json['vacc_id'];
    vacc_place = json['vacc_place'];
    vacc_date = json['vacc_date'];
    vacc_time = json['vacc_time'];
    haj_id = json['haj_id'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vacc_id'] = this.vacc_id;
    data['vacc_place'] = this.vacc_place;
    data['vacc_date'] = this.vacc_date;
    data['vacc_time'] = this.vacc_time;
    data['haj_id'] = this.haj_id;
    return data;
  }
}
