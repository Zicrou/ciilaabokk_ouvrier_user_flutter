import 'package:ciilaabokk_ouvrier_user/app/modules/ouvrier/ouvrierController.dart';
import 'package:ciilaabokk_ouvrier_user/app/modules/ouvriers/ouvriersController.dart';
import 'package:ciilaabokk_ouvrier_user/app/modules/ouvriers/ouvriers_binding.dart';
import 'package:get/get.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/providers/api_providers.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/providers/auth_providers.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/providers/storage_providers.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/repositories/auth_repositories.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/services/auth_services.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/services/remote_services.dart';
import 'package:ciilaabokk_ouvrier_user/app/modules/auths/auth_controller.dart';
import 'package:ciilaabokk_ouvrier_user/app/modules/signup/Signup_controller.dart';

class AppInitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(StorageProvider(), permanent: true);
    Get.put(AuthProvider(), permanent: true);
    Get.put(ApiProvider());

    Get.put(AuthRepositories()); // MUST come before AuthServices
    Get.lazyPut(() => AuthServices());
    Get.put(RemoteServices());
    // safe to find dependencies
    Get.lazyPut(() => SignupController());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => OuvriersController());
    Get.lazyPut(() => OuvrierController());
  }
}
