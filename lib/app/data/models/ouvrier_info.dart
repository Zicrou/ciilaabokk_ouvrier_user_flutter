import 'package:ciilaabokk_ouvrier_user/app/data/models/domaine.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/metier.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/ouvrier.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/region.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/departement.dart';
import 'package:get/get.dart';

class OuvrierInfo {
  RxList<Ouvrier> ouvriers = <Ouvrier>[].obs;
  RxList<Domaine> domaines = <Domaine>[].obs;
  RxList<Metier> metiers = <Metier>[].obs;
  RxList<Region> regions = <Region>[].obs;
  RxList<Departement> departements = <Departement>[].obs;

  OuvrierInfo({
    required this.ouvriers,
    required this.domaines,
    required this.metiers,
    required this.regions,
    required this.departements,
  });

  OuvrierInfo.fromJson(Map<String, dynamic> json) {
    if (json['ouvriers'] != null) {
      ouvriers = ouvriers;
      json['ouvriers'].forEach((v) {
        ouvriers!.add(new Ouvrier.fromJson(v));
      });
    }

    if (json['domaines'] != null) {
      domaines = domaines;
      json['domaines'].forEach((v) {
        domaines!.add(new Domaine.fromJson(v));
      });
      print("Domaines: ${domaines.toString()}");
    }
    if (json['metiers'] != null) {
      metiers = metiers;
      json['metiers'].forEach((v) {
        metiers!.add(new Metier.fromJson(v));
      });
      print("Metiers: ${metiers.toString()}");
    }

    if (json['regions'] != null) {
      regions = regions;
      json['regions'].forEach((v) {
        regions!.add(new Region.fromJson(v));
      });
      print("Regions: ${regions.toString()}");
    }

    if (json['departements'] != null) {
      departements = departements;
      json['departements'].forEach((v) {
        departements!.add(new Departement.fromJson(v));
      });
      print("Departements: ${departements.toString()}");
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   //if (this.ventes != null) {
  //   data['ventes'] = this.ventes.map((v) => v.toJson()).toList();
  //   //}
  //   if (this.input != null) {
  //     data['input'] = this.input;
  //   }
  //   data['totalOfTheDay'] = this.totalOfTheDay;
  //   data['totalVenteOfTheDay'] = this.totalVenteOfTheDay;
  //   data['totalReparationOfTheDay'] = this.totalReparationOfTheDay;
  //   data['depenseTotal'] = this.depenseTotal;
  //   data['status'] = this.status;
  //   return data;
  // }

  @override
  String toString() {
    return 'OuvrierInfos: $ouvriers';
  }
}
