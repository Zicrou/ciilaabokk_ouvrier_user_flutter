import 'package:ciilaabokk_ouvrier_user/app/data/models/ouvrier.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/ouvrier_info.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/region.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/providers/auth_providers.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/repositories/ouvriers_repository.dart';
import 'package:ciilaabokk_ouvrier_user/app/modules/auths/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/services/auth_services.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class OuvrierController extends GetxController {
  var isLoading = false.obs;
  final auth_services = Get.find<AuthServices>();
  final authControler = Get.find<AuthController>();
  final authProvider = Get.find<AuthProvider>();
  var ouvrier = <Ouvrier>[].obs;
  //RxList<VenteInfo> listeVentes = <VenteInfo>[].obs;
  // Rx<VenteResponse?> venteResponse = Rx<VenteResponse?>(null);
  // final OuvriersRepository _ouvriersRepository = Get.find<OuvriersRepository>();

  @override
  void onInit() {
    super.onInit();
    // Initialize any necessary data or state here
    // final args = Get.arguments;
    print("Arguments: ${Get.arguments}");

    // if (args == null) {
    //   // print({args['produit']});
    // } else if (args['ouvrier'] != null) {
    //   ouvrier.add(args['ouvrier']);
    //   print("Arguments on Inti : ${args}");
    // }
  }

  Future<void> showOuvrier(Ouvrier ouvrier) async {
    try {
      isLoading(true);
      // var ventes = await RemoteServices.fetchVentes();
      print("Call Ouvriers repository");
      // var response = await _ouvriersRepository.listOuvriers();
      // print("Ouvrier from ouvrierController: ${response}");

      //listeresponse = await _authServices.getAllVentes();
      // ouvrierList.assignAll([response]);

      // logger.i("Fetched ouvriers: ${ouvrierList.toString()}");
    } catch (e) {
      print("Error fetching ventes: $e");
    } finally {
      isLoading(false);
    }
  }

  String formattedDistance(double? distance) {
    if (distance == null) return '';

    if (distance < 1) {
      return '${(distance * 1000).round()} m';
    }

    return '${distance!.toStringAsFixed(1)} km';
  }
}
