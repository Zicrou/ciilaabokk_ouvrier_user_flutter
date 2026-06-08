import 'package:ciilaabokk_ouvrier_user/app/data/models/departement.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/domaine.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/metier.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/ouvrier_info.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/region.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/providers/auth_providers.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/repositories/ouvriers_repository.dart';
import 'package:ciilaabokk_ouvrier_user/app/modules/auths/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/services/auth_services.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class OuvriersController extends GetxController {
  var isLoading = false.obs;
  final auth_services = Get.find<AuthServices>();
  final authControler = Get.find<AuthController>();
  final authProvider = Get.find<AuthProvider>();
  var ouvrierList = <OuvrierInfo>[].obs;
  //RxList<VenteInfo> listeVentes = <VenteInfo>[].obs;
  // Rx<VenteResponse?> venteResponse = Rx<VenteResponse?>(null);
  final OuvriersRepository _ouvriersRepository = Get.find<OuvriersRepository>();
  var selectedRegion = Rx<Region?>(null);
  final regionlist = <Region?>[].obs;
  final departementList = <Departement?>[].obs;
  final domaineList = <Domaine?>[].obs;
  final metierList = <Metier?>[].obs;
  final telephone = TextEditingController();
  var selectedDepartement = Rx<Departement?>(null);
  var selectedDomaine = Rx<Domaine?>(null);
  var selectedMetier = Rx<Metier?>(null);

  @override
  void onInit() {
    super.onInit();
    // Initialize any necessary data or state here
    fetchOuvriers();
    searchedOuvriers();
  }

  Future<void> fetchOuvriers() async {
    try {
      isLoading(true);
      // var ventes = await RemoteServices.fetchVentes();
      print("Call Ouvriers repository");
      var response = await _ouvriersRepository.listOuvriers();
      print("Ouvrier from ouvrierController: ${response}");

      //listeresponse = await _authServices.getAllVentes();
      ouvrierList.assignAll([response]);

      logger.i("Fetched ouvriers: ${ouvrierList.toString()}");
    } catch (e) {
      print("Error fetching ouvriers: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<dynamic> searchedOuvriers() async {
    var tel = telephone.text.trim();
    final researchedData = {
      "region_id": "", //selectedRegion?.value?.id,
      "departement_id": "", //selectedDepartement?.value?.id,
      "domaine_id": 1, //selectedDomaine?.value?.id,
      "metier_id": "", //selectedMetier?.value?.id,
      "phone_number": "", //tel,
    };
    try {
      isLoading(true);
      final response = await _ouvriersRepository.rechercheOuvriers(
        researchedData,
      );
    } catch (e) {
      print("Error searching: ${e}");
      throw Exception("Erreur searching ${e.toString()}");
    } finally {
      isLoading(false);
    }
  }
}
