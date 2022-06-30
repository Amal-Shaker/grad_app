class Rating {
  int? id;
  int? company_id;
  String? haj_id;
  String? rating_note;
  int? rating;
  Rating(
      {this.id, this.company_id, this.haj_id, this.rating_note, this.rating});
  Rating.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company_id = json['company_id'];
    haj_id = json['haj_id'];
    rating_note = json['rating_note'];
    rating = json['rating'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_id'] = this.company_id;
    data['haj_id'] = this.haj_id;
    data['rating_note'] = this.rating_note;
    data['rating'] = this.rating;
    return data;
  }
}
