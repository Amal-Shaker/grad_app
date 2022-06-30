class Company {
  String? Company_name;
  int? company_id;
  String? about_us;
  String? tel;
  String? mobile;
  String? logo;
  String? address;
  int? user_id;
  int? building_id;

  Company(
      {this.Company_name,
      this.company_id,
      this.about_us,
      this.address,
      this.building_id,
      this.logo,
      this.mobile,
      this.tel,
      this.user_id});

  Company.fromJson(Map<String, dynamic> json) {
    Company_name = json['Company_name'];
    company_id = json['company_id'];
    about_us = json['about_us'];
    address = json['address'];
    building_id = json['building_id'];
    logo = json['logo'];
    mobile = json['mobile'];
    tel = json['tel'];
    user_id = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Company_name'] = this.Company_name;
    data['company_id'] = this.company_id;
    data['about_us'] = this.about_us;
    data['address'] = this.address;
    data['building_id'] = this.building_id;
    data['logo'] = this.logo;
    data['mobile'] = this.mobile;
    data['tel'] = this.tel;
    data['user_id'] = this.user_id;

    return data;
  }
}

// class CompanyContact {
//   String? mobile;
//   String? tel;
//   CompanyContact({this.mobile, this.tel});
//   CompanyContact.fromJson(Map<String, dynamic> json) {
//     mobile = json['mobile'];
//     tel = json['tel'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();

//     data['mobile'] = this.mobile;
//     data['tel'] = this.tel;

//     return data;
//   }
// }
