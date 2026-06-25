class Domaine {
  String? id;
  String? name;

  Domaine({this.id, this.name});

  Domaine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;

    return data;
  }

  @override
  String toString() {
    return "Id: ${id}, Name: ${name}";
  }
}
