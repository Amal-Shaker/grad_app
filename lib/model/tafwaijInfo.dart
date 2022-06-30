class TafwaijInfo {
  String? title;
  String? body;
  String? dateTime;
  TafwaijInfo({this.body, this.dateTime, this.title});

  TafwaijInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    dateTime = json['dateTime'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['body'] = this.body;
    data['dateTime'] = this.dateTime;

    return data;
  }
}
