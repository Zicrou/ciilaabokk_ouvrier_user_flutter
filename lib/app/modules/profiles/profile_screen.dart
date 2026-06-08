import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/repositories/profile_repository.dart';
import 'package:ciilaabokk_ouvrier_user/app/modules/profiles/profiles_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfilesController profilesController = Get.put(ProfilesController());

  @override
  void initState() {
    super.initState();
    final args = Get.arguments;
    print("ProfileScreen initState called : ${args?["ownerId"]}");
    profilesController.ownerId.value = args?["ownerId"] ?? "";
    // profilesController.getProfile(profilesController.ownerId.value);
  }

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    profilesController.ownerId.value = args?["ownerId"] ?? "";
    return const Text("Hello profile");
  }
}
