class Portfolio {
  String? id;
  String? image;
  String? ouvrierId;

  Portfolio({this.id, this.image, this.ouvrierId});

  Portfolio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    ouvrierId = json['ouvrier_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['image'] = image;
    data['ouvrier_id'] = ouvrierId;

    return data;
  }

  @override
  String toString() {
    return "Id: ${id}, Image: ${image}, OuvrierId: ${ouvrierId}";
  }
}
