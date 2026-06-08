class Metier {
  int? id;
  String? name;
  int? domaineId;

  Metier({this.id, this.name, this.domaineId});

  Metier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    domaineId = json['domain_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['domain_id'] = domaineId;

    return data;
  }

  @override
  String toString() {
    return "Id: ${id}, Name: ${name}, Metier: ${domaineId}";
  }
}
