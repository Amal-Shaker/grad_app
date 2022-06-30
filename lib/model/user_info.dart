class UserInformation {
  int? sid;
  int? main_haj_sid;
  String? name1;
  String? name2;
  String? name3;
  String? name4;
  int? status;
  int? region;
  int? season;
  int? haj_relationship;
  String? gender;
  String? mother_name;
  String? area;
  String? city;
  String? street;
  String? house_no;
  String? mobile;
  String? tel;
  String? birth_place;
  String? sid_muhrem;
  String? dob;
  int? social_status;
  int? age;
  int? user_id;
  int? room_id;
  String? passport_num;

  UserInformation(
      {this.sid,
      this.name1,
      this.name2,
      this.name3,
      this.name4,
      this.status,
      this.region,
      this.season,
      this.haj_relationship,
      this.gender,
      this.age,
      this.area,
      this.birth_place,
      this.city,
      this.dob,
      this.house_no,
      this.mobile,
      this.mother_name,
      this.passport_num,
      this.room_id,
      this.sid_muhrem,
      this.social_status,
      this.street,
      this.tel,
      this.user_id});

  UserInformation.fromJson(Map<String, dynamic> json) {
    sid = json['sid'];
    main_haj_sid = json['main_haj_sid'];
    name1 = json['name1'];
    name2 = json['name2'];
    name3 = json['name3'];
    name4 = json['name4'];
    //status = json['status'];
    //region = json['region'];
    //season = json['season'];
    //haj_relationship = json['haj-relationship'];
    gender = json['gender'];
    mother_name = json['mother_name'];
    area = json['area'];
    city = json['city'];
    street = json['street'];
    house_no = json['house_no'];
    mobile = json['mobile'];
    tel = json['tel'];
    birth_place = json['birth_place'];
    //sid_muhrem = json['sid-muhrem'];
    dob = json['dob'];
    social_status = json['social_status'];
    age = json['age'];
    //user_id = json['user_id'];
    //room_id = json['room-id'];
    //passport_num = json['passport_num'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sid'] = this.sid;
    data['main_haj_sid'] = this.main_haj_sid;
    data['name1'] = this.name1;
    data['name2'] = this.name2;
    data['name3'] = this.name3;
    data['name4'] = this.name4;
    // data['status'] = this.status;
    // data['region'] = this.region;
    // data['season'] = this.season;
    // data['haj-relationship'] = this.haj_relationship;
    data['gender'] = this.gender;
    data['mother_name'] = this.mother_name;
    data['area'] = this.area;
    data['city'] = this.city;
    data['street'] = this.street;
    data['house_no'] = this.house_no;
    data['mobile'] = this.mobile;
    data['tel'] = this.tel;
    data['birth_place'] = this.birth_place;
    //data['sid_muhrem'] = this.sid_muhrem;
    data['dob'] = this.dob;
    data['social_status'] = this.social_status;
    data['age'] = this.age;
    //data['user_id'] = this.user_id;
    // data['room-id'] = this.room_id;
    // data['passport_num'] = this.passport_num;
    return data;
  }
}
