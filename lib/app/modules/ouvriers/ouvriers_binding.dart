import 'package:ciilaabokk_ouvrier_user/app/data/repositories/ouvriers_repository.dart';
import 'package:ciilaabokk_ouvrier_user/app/modules/ouvriers/ouvriersController.dart';
import 'package:get/get.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/providers/auth_providers.dart';
import 'package:ciilaabokk_ouvrier_user/app/modules/auths/auth_controller.dart';

class OuvriersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => AuthProvider());
    Get.put(() => AuthController());
    Get.lazyPut(() => OuvriersRepository());
    Get.put(OuvriersController());
  }
}
