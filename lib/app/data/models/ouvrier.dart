import 'package:ciilaabokk_ouvrier_user/app/data/models/country.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/departement.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/domaine.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/entreprises.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/metier.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/portfolio.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/region.dart';
import 'package:get/get.dart';

class Ouvrier {
  String? id;
  String? name;
  String? phoneNumber;
  String? email;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? avatar;
  String? phoneNumber2;
  String? adress;
  dynamic dateOfBirth;
  String? photo;
  String? photoCni;
  List<Entreprises>? entreprises;
  int? anneeExperience;
  String? userId;
  List<Metier>? metiers;
  Domaine? domaines;
  Country? country;
  Region? region;
  Departement? departement;
  List<Portfolio>? portfolios = <Portfolio>[];
  double? distance;
  Ouvrier({
    this.id,
    this.name,
    this.phoneNumber,
    this.email,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.avatar,
    this.phoneNumber2,
    this.adress,
    this.dateOfBirth,
    this.photo,
    this.photoCni,
    this.entreprises,
    this.anneeExperience,
    this.userId,
    this.country,
    this.region,
    this.departement,
    this.domaines,
    this.metiers,
    this.portfolios,
    this.distance,
  });

  Ouvrier.fromJson(Map<String, dynamic> json) {
    print("json: ${json}");
    try {
      id = json['id'];
      name = json['name'];
      phoneNumber = json['phone_number'];
      email = json['email'];
      deletedAt = json['deleted_at'];
      createdAt = json['created_at'];
      updatedAt = json['updated_at'];
      avatar = json['avatar'] ?? "";
      entreprises = (json['entreprises'] as List?)
          ?.map((m) => Entreprises.fromJson(m))
          .toList();

      phoneNumber2 = json["phone_number"];
      adress = json["address"];
      dateOfBirth = json["date_of_birth"];
      photo = json["photo"];
      photoCni = json["photo_cni"];
      anneeExperience = json["annees_experience"];
      userId = json["user_id"];
      metiers = (json['metiers'] as List?)
          ?.map((m) => Metier.fromJson(m))
          .toList();
      print("Liste des metiers de l'ouvrier: ${metiers?.toList()}");

      country = json['country'] != null
          ? Country.fromJson(json['country'])
          : null;
      region = json['region'] != null ? Region.fromJson(json['region']) : null;
      departement = json['departement'] != null
          ? Departement.fromJson(json['departement'])
          : null;
      if (json['portfolios'] != null) {
        portfolios = portfolios;
        json['portfolios'].forEach((p) {
          portfolios!.add(new Portfolio.fromJson(p));
        });
      }
      distance = json['distance'] != null
          ? double.tryParse(json['distance'].toString())
          : null;
    } catch (e, s) {
      print('Error in Ouvrier.fromJson: $e');
      print(s);
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['avatar'] = avatar;
    return data;
  }

  @override
  String toString() {
    return "Id: ${id}, Name: ${name}, Phone number: ${phoneNumber}, Email: ${email}, DeletedAt: ${deletedAt}, CreatedAt: ${createdAt}, UpdatedAt: ${updatedAt}, Avatar: ${avatar}, Portfolio: ${portfolios.toString()}, distance: ${distance.toString()}";
  }
}
