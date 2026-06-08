class Departement {
  int? id;
  String? name;
  int? regionId;

  Departement({this.id, this.name, this.regionId});

  Departement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    regionId = json['region_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['region_id'] = regionId;

    return data;
  }

  @override
  String toString() {
    return "Id: ${id}, Name: ${name}, Region: ${regionId}";
  }
}
