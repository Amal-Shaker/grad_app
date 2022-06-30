class HajAppData {
  int? main_haj_sid;
  int? company_id;
  String? address;
  String? Company_name;
  String? mabile_number;

  HajAppData(
      {this.Company_name,
      this.address,
      this.company_id,
      this.mabile_number,
      this.main_haj_sid});

  HajAppData.fromJson(Map<String, dynamic> json) {
    main_haj_sid = json['main_haj_sid'];
    company_id = json['company_id'];
    address = json['address'];
    Company_name = json['Company_name'];
    mabile_number = json['mabile_number'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['main_haj_sid'] = this.main_haj_sid;
    data['company_id'] = this.company_id;
    data['address'] = this.address;
    data['Company_name'] = this.Company_name;
    data['mabile_number'] = this.mabile_number;
    return data;
  }
}
