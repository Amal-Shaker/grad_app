class Companion {
  int? sid;
  String? address;
  String? mabile;
  int? main_haj_sid;
  String? name1;
  String? name2;
  String? name3;
  String? name4;
  String? mother_name;
  String? gender;
  String? mobile;
  Companion(
      {this.sid,
      this.address,
      this.mabile,
      this.main_haj_sid,
      this.name1,
      this.name2,
      this.name3,
      this.name4,
      this.mother_name,
      this.gender,
      this.mobile});

  Companion.fromJson(Map<String, dynamic> json) {
    sid = json['sid'];
    mobile = json['mobile'];
    address = json['address'];
    main_haj_sid = json['main_haj_sid'];
    name1 = json['name1'];
    name2 = json['name2'];
    name3 = json['name3'];
    name4 = json['name4'];
    mother_name = json['mother_name'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sid'] = this.sid;
    data['address'] = this.address;
    data['mabile'] = this.mabile;
    data['moble'] = this.mobile;
    data['main_haj_sid'] = this.main_haj_sid;
    data['name1'] = this.name1;
    data['name2'] = this.name2;
    data['name3'] = this.name3;
    data['name4'] = this.name4;
    data['mother_name'] = this.mother_name;
    data['gender'] = this.gender;

    return data;
  }
}
