import 'package:ciilaabokk_ouvrier_user/app/data/models/domaine.dart';

class Metier {
  String? id;
  String? name;
  String? domaineId;
  Domaine? domaine;

  Metier({this.id, this.name, this.domaineId});

  Metier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    domaineId = json['domaine_id'];
    domaine = json['domaine'] != null
        ? Domaine.fromJson(json['domaine'])
        : null;
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
    return "Id: ${id}, Name: ${name}, domaine: ${domaine.toString()}";
  }
}
