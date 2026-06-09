import 'package:ciilaabokk_ouvrier_user/app/core/exceptions/network_exceptions.dart';
import 'package:ciilaabokk_ouvrier_user/app/core/values/endpoints.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/departement.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/metier.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/ouvrier_info.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/providers/api_providers.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class OuvriersRepository {
  final _apiProvider = Get.find<ApiProvider>();

  // Future createVente(Map<String, dynamic> json) async {
  //   try {
  //     logger.i("Json from Repositories: ${json}");
  //     final res = await _apiProvider.post(createVenteEndpoint, json);
  //     logger.w(
  //       'AuthRepositories: Create Vente response message: ${res}', //res['message']
  //     );
  //     return res;
  //   } on BadRequestException {
  //     rethrow;
  //   }
  // }

  // Future<dynamic> updateVente(int id, Map<String, dynamic> json) async {
  //   try {
  //     logger.i("Id from Repositories: ${id}");
  //     final res = await _apiProvider.put('$venteUpdateEndpoint$id', json);
  //     logger.i('$venteUpdateEndpoint$id');
  //     logger.w('AuthRepositories Update Vente response: $res');
  //     return res;
  //   } on FetchDataException {
  //     errorMessage("Erreur");
  //   } on BadRequestException {
  //     rethrow;
  //   }
  // }

  // Future deleteVente(int id) async {
  //   try {
  //     logger.i("Id from Repositories: ${id}");
  //     final res = await _apiProvider.delete('$venteDeleteEndpoint$id');
  //     logger.i('$venteDeleteEndpoint$id');
  //     logger.w('AuthRepositories: Delete Vente response: $res');
  //     return res;
  //   } on BadRequestException {
  //     rethrow;
  //   }
  // }

  Future<OuvrierInfo> listOuvriers() async {
    final response = await _apiProvider.get(ouvriersListEndpoint);
    print("Response: ${response}");
    print("Response: ${response["domaines"]}");
    //final ventesResponse = VenteResponse.fromJson(response.data);
    return OuvrierInfo.fromJson(response);
  }

  Future<dynamic> rechercheOuvriers(Map<String, dynamic> json) async {
    final tel = json["phone_number"];
    final metierId = json["metier_id"];
    final domaineId = json["domaine_id"];
    final departementId = json["departement_id"];
    final regionId = json["region_id"];
    print("Params tel: $tel");
    var params =
        'phone_number=$tel&metier_id=$metierId&domain_id=$domaineId&departement_id=$departementId&region_id=$regionId';
    final response = await _apiProvider.get(
      '$rechercheOuvriersListEndpoint?$params',
    );
    print("Response recherche: ${response}");
    return OuvrierInfo.fromJson(response);

    //fromJson(response['produit']);
  }

  Future<dynamic> selectFilterMetierByDomaine(int? domaine_id) async {
    var domaineId = domaine_id;
    // final regionId = json["region_id"];

    var params = 'domaine_id=';
    if (domaineId != null) {
      params = 'domaine_id=$domaineId';
    }

    final response = await _apiProvider.get(
      '$selectFilterDomaineEndpoint?$params',
    );
    final res = response as List;
    print("Response filtered metiers: ${response}");
    print("Response filtered metiers: ${response[0]}");

    // The return type is List dynamic
    return res.map((m) => Metier.fromJson(m)).toList();
  }

  Future<dynamic> selectFilterDepartementByRegion(int? region_id) async {
    var regionId = region_id;
    // final regionId = json["region_id"];

    var params = 'region_id=';
    if (regionId != null) {
      params = 'region_id=$regionId';
    }

    final response = await _apiProvider.get(
      '$selectFilterRegionEndpoint?$params',
    );
    final res = response as List;
    print("Response filtered departements: ${response}");
    print("Response filtered departements: ${response[0]}");

    // The return type is List dynamic
    return res.map((m) => Departement.fromJson(m)).toList();
  }
}
