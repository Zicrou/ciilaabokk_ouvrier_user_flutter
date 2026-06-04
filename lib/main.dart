// /lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ciilaabokk_ouvrier_user/app/initial_bindings.dart';
import 'package:ciilaabokk_ouvrier_user/app/modules/login/login_screen.dart';
import 'package:ciilaabokk_ouvrier_user/app/modules/profiles/profile_screen.dart';
import 'package:ciilaabokk_ouvrier_user/app/modules/signup/signup_screen.dart';
import 'package:ciilaabokk_ouvrier_user/app/routes/routes.dart';
import 'package:ciilaabokk_ouvrier_user/pages/home_page.dart';
import 'package:ciilaabokk_ouvrier_user/app/modules/auths/auth_controller.dart';

void main() {
  runApp(const CiilaabokkOuvrierUser());
}

class CiilaabokkOuvrierUser extends StatelessWidget {
  const CiilaabokkOuvrierUser({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Getx Auth',
      theme: ThemeData(
        primaryColor: Color(0xFF493AD5),
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
      ),
      initialBinding: AppInitialBindings(),
      home: LoginScreen(),
    );
  }
}
