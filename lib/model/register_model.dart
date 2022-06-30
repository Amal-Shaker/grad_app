class RegisterRequest {
  String? sid;
  String? email;
  String? password;
  int? type;

  RegisterRequest({this.sid, this.email, this.password, this.type});

  toMap() {
    return {'id': sid, 'email': email, 'password': password, 'type': type};
  }

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    sid = json['sid'];
    email = json['email'];
    password = json['password'];
    type = json['type'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sid'] = this.sid;
    data['email'] = this.email;
    data['password'] = this.password;
    data['type'] = this.type;
    return data;
  }
}
