import 'package:ciilaabokk_ouvrier_user/app/modules/ouvriers/ouvriers_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/providers/auth_providers.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/services/auth_services.dart';
import 'package:ciilaabokk_ouvrier_user/app/modules/login/login_screen.dart';
import 'package:ciilaabokk_ouvrier_user/app/routes/routes.dart';
import 'package:ciilaabokk_ouvrier_user/app/utils/messages.dart';
import 'package:ciilaabokk_ouvrier_user/pages/home_page.dart';
import 'package:logger/web.dart';

Logger logger = Logger();

class AuthController extends GetxController {
  final AuthProvider authProvider = Get.find<AuthProvider>();

  final AuthServices authServices = AuthServices();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  final _isLoading = false.obs;

  get isLoading => _isLoading.value;
  var phoneNumberController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var loginController = TextEditingController();
  var emailController = TextEditingController();
  var password_confirmation_controller = TextEditingController();
  var isPhoneNumberValid = true.obs;
  var isPasswordValid = true.obs;
  var isNameValid = true.obs;
  var isEmailValid = true.obs;
  var isLoginValid = true.obs;
  // var args = Get.arguments;

  void onInit() {
    super.onInit();
  }

  void login() async {
    try {
      print("conecting..");
      _isLoading.value = true;
      if (loginFormKey.currentState!.validate()) {
        loginFormKey.currentState!.save();
        String login = loginController.text.trim();
        String password = passwordController.text.trim();

        // Call the post Api method to send data
        var userInfo = await authServices.login(login, password);
        logger.i("Response Auth Controller: ${userInfo}");

        loginController.clear();
        passwordController.clear();

        authProvider.user = userInfo;

        print("Current route: ${Get.currentRoute}"); // Debugging line
        print("Previous route: ${Get.previousRoute}"); // Debugging line
        // Get.offAll(() => VentesScreen());
        Get.to(HomePage());
        // if (Get.previousRoute == Routes.videosFollowing) {
        //   Get.toNamed(
        //     Routes.videosFollowing,
        //   );
        // } else if (Get.previousRoute == Routes.home) {
        //   Get.toNamed(
        //     Routes.home,
        //   );
        // }
        goodMessage("Connexion avec succés");
      }
    } catch (e) {
      errorMessage("Impossible de se connecter");
      logger.w("Error: ${e}");
    } finally {
      _isLoading.value = false;
    }
  }

  void signup() async {
    String phoneNumber = phoneNumberController.text.trim();
    String password = passwordController.text.trim();
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password_confirmation = password_confirmation_controller.text.trim();
    try {
      if (signupFormKey.currentState!.validate()) {
        //signupFormKey.currentState!.save();
        logger.i("Signin in signinFormKey : ${signupFormKey}");
        _isLoading.value = true;
        var userRegistred = authServices.signin(
          name,
          phoneNumber,
          password,
          password_confirmation,
          email,
        );
        authProvider.userRegister = await userRegistred;
        Get.offAll(() => HomePage());
        goodMessage("Succés: Inscription");
      }
    } catch (e) {
      errorMessage("Erreur");
    } finally {
      _isLoading.value = false;
    }
    //validating email and password and checking a static email just for checking

    //var response = remoteServices.signUp(name, phoneNumber, password);
  }

  Future<void> logout() async {
    // Rebind if need it
    goodMessage("Déconneté");
    try {
      await authServices.signout();
      // authProvider.reset();
      Get.offAll(() => LoginScreen());
    } catch (e) {
      logger.w("Error during signout: ${e}");
    }
  }
}
