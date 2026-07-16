import 'package:ciilaabokk_ouvrier_user/app/data/models/departement.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/domaine.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/metier.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/ouvrier_info.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/region.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/providers/auth_providers.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/repositories/ouvriers_repository.dart';
import 'package:ciilaabokk_ouvrier_user/app/modules/auths/auth_controller.dart';
import 'package:ciilaabokk_ouvrier_user/services/location_services.dart';
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
  final GlobalKey<FormState> rechercheKeyForm = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    // Initialize any necessary data or state here
    fetchOuvriers();
  }

  Future<void> fetchOuvriers() async {
    try {
      isLoading(true);
      // var ventes = await RemoteServices.fetchVentes();
      print("Call Ouvriers repository");
      var response = await _ouvriersRepository.listOuvriers();
      print("Ouvrier from ouvrierController: ${response}");
      var metiers = response.metiers;
      var domaines = response.domaines;
      // var regions = response.regions;
      // print("Response Region: ${response.regions}");
      // print("Region assigned : ${regions.toString()}");
      var departements = response.departements;
      if (metiers.value != null) {
        for (var metier in metiers) metierList.add(metier);
      }
      if (domaines.value != null) {
        for (var domaine in domaines) domaineList.add(domaine);
      }

      if (response.regions.isNotEmpty) {
        regionlist.clear();
        print("Response Region: ${response.regions}");
        var regions = response.regions;
        print("Region assigned : ${regions.toString()}");
        for (var region in regions) {
          regionlist.add(region);
        }
      }

      if (departements.value != null) {
        departementList.clear();
        for (var departement in departements) {
          departementList.add(departement);
          print("departements: ${departementList.toString()}");
        }
        print("departements: ${departementList.toString()}");
      }

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
    if (rechercheKeyForm.currentState!.validate()) {
      rechercheKeyForm.currentState!.save();

      var tel = telephone.text.trim();
      var regionSelected = (selectedRegion?.value?.id != null)
          ? selectedRegion?.value?.id
          : "";
      var departementSelected = (selectedDepartement?.value?.id != null)
          ? selectedDepartement?.value?.id
          : "";
      var domaineSelected = (selectedDomaine?.value?.id != null)
          ? selectedDomaine?.value?.id
          : "";
      var metierSelected = (selectedMetier?.value?.id != null)
          ? selectedMetier?.value?.id
          : "";
      final position = await LocationServices.getCurrentLocation();

      final researchedData = {
        "region_id": regionSelected,
        "departement_id": departementSelected,
        "domaine_id": domaineSelected,
        "metier_id": metierSelected,
        "phone_number": tel,
        "latitude": position.latitude,
        "longitude": position.longitude,
      };
      print("User's latitude: ${position.latitude}");
      print("User's longitude: ${position.longitude}");

      try {
        isLoading(true);
        final response = await _ouvriersRepository.rechercheOuvriers(
          researchedData,
        );
        ouvrierList.assignAll([response]);
        //
        print("is ouvriers empty : ${ouvrierList[0].ouvriers.isEmpty}");
      } catch (e) {
        print("Error searching: ${e}");
        throw Exception("Erreur searching ${e.toString()}");
      } finally {
        isLoading(false);
      }
    }
  }

  Future<dynamic> selecFilterRegion() async {
    var selected_region = selectedRegion.value?.id;
    try {
      isLoading(true);
      final response = await _ouvriersRepository
          .selectFilterDepartementByRegion(selected_region);
      if (response == "") {
      } else {
        departementList.assignAll(response);
      }
      print(
        "Liste departements dans filterRegion controller: ${departementList.toString()}",
      );
    } catch (e) {
      print("Error searching: ${e}");
      throw Exception("Erreur searching ${e.toString()}");
    } finally {
      isLoading(false);
    }
  }

  Future<dynamic> selecFilterDomaine() async {
    var selected_domaine = selectedDomaine.value?.id;
    // if (selected_domaine != null) {
    try {
      isLoading(true);
      final response = await _ouvriersRepository.selectFilterMetierByDomaine(
        selected_domaine,
      );
      metierList.assignAll(response);
      print(metierList.toString());
    } catch (e) {
      print("Error searching: ${e}");
      throw Exception("Erreur searching ${e.toString()}");
    } finally {
      isLoading(false);
    }
    // }
  }

  void resetForm() {
    telephone.clear();

    selectedDepartement.value = null;

    selectedRegion.value = null;

    selectedDomaine.value = null;

    selectedMetier.value = null;
  }

  String formattedDistance(double? distance) {
    if (distance == null) return '';

    if (distance < 1) {
      return '${(distance * 1000).round()} m';
    }

    return '${distance!.toStringAsFixed(1)} km';
  }
}
