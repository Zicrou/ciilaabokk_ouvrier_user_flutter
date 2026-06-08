class Region {
  int? id;
  String? name;
  int? countryId;

  Region({this.id, this.name, this.countryId});

  Region.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['country_id'] = countryId;

    return data;
  }

  @override
  String toString() {
    return "Id: ${id}, Name: ${name}, Region: ${countryId}";
  }
}
