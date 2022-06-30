class SosInfo {
  int? id;
  int? sid;
  String? address;
  String? latitude;
  String? longitude;
  int? company_id;
  int? isFinish;
  SosInfo(
      {this.address,
      this.company_id,
      this.isFinish,
      this.latitude,
      this.longitude,
      this.sid,
      this.id});

  SosInfo.fromJson(Map<String, dynamic> json) {
    sid = json['sid'];
    id = json['id'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    company_id = json['company_id'];
    isFinish = json['isFinish'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sid'] = this.sid;
    data['id'] = this.id;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['company_id'] = this.company_id;
    data['isFinish'] = this.isFinish;

    return data;
  }
}
