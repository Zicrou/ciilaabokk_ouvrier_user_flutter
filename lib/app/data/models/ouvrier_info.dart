import 'package:ciilaabokk_ouvrier_user/app/data/models/ouvrier.dart';
import 'package:get/get.dart';

class OuvrierInfo {
  RxList<Ouvrier> ouvriers = <Ouvrier>[].obs;

  OuvrierInfo({required this.ouvriers});

  OuvrierInfo.fromJson(Map<String, dynamic> json) {
    if (json['ouvriers'] != null) {
      ouvriers = ouvriers;
      json['ouvriers'].forEach((v) {
        ouvriers!.add(new Ouvrier.fromJson(v));
      });
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
    return 'VenteInfo: $ouvriers';
  }
}
