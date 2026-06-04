import 'package:get/get.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/providers/auth_providers.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/repositories/auth_repositories.dart';
import 'package:ciilaabokk_ouvrier_user/app/modules/auths/auth_controller.dart';
import 'package:ciilaabokk_ouvrier_user/app/modules/signup/Signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthProvider());
    Get.put(SignupController());
    Get.put(AuthRepositories());
    Get.put(AuthController());
  }
}
