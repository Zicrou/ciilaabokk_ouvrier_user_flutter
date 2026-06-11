import 'package:ciilaabokk_ouvrier_user/app/data/models/country.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/departement.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/domaine.dart';
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
  int? metierId;
  int? domaineId;
  int? regionId;
  int? departementId;
  int? countryId;
  String? phoneNumber2;
  String? adress;
  dynamic dateOfBirth;
  String? photo;
  String? photoCni;
  String? entreprises;
  int? anneeExperience;
  String? userId;
  Metier? metier;
  Domaine? domaine;
  Country? country;
  Region? region;
  Departement? departement;
  RxList<Portfolio>? portfolios = <Portfolio>[].obs;

  Ouvrier({
    this.id,
    this.name,
    this.phoneNumber,
    this.email,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.avatar,
    this.metierId,
    this.domaineId,
    this.regionId,
    this.departementId,
    this.countryId,
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
    this.domaine,
    this.metier,
    this.portfolios,
  });

  Ouvrier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    avatar = json['avatar'] ?? "";
    metierId = json["metier_id"];
    domaineId = json["doamin_id"];
    regionId = json["region_id"];
    departementId = json["departement_id"];
    countryId = json["country_id"];
    phoneNumber2 = json["phone_number"];
    adress = json["address"];
    dateOfBirth = json["date_of_birth"];
    photo = json["photo"];
    photoCni = json["photo_cni"];
    entreprises = json["entreprises"];
    anneeExperience = json["annees_experience"];
    userId = json["user_id"];
    metier = json['metier'] != null ? Metier.fromJson(json['metier']) : null;
    domaine = json['metier']['domain'] != null
        ? Domaine.fromJson(json['metier']['domain'])
        : null;
    country = json['country'] != null
        ? Country.fromJson(json['country'])
        : null;
    region = json['region'] != null ? Region.fromJson(json['region']) : null;
    departement = json['departement'] != null
        ? Departement.fromJson(json['departement'])
        : null;
    if (json['portfolio'] != null) {
      portfolios = portfolios;
      json['portfolio'].forEach((p) {
        portfolios!.add(new Portfolio.fromJson(p));
      });
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
    return "Id: ${id}, Name: ${name}, Phone number: ${phoneNumber}, Email: ${email}, DeletedAt: ${deletedAt}, CreatedAt: ${createdAt}, UpdatedAt: ${updatedAt}, Avatar: ${avatar}, Portfolio: ${portfolios.toString()}";
  }
}
