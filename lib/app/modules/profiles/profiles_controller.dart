import 'package:get/get.dart';

import 'package:ciilaabokk_ouvrier_user/app/data/repositories/profile_repository.dart';

class ProfilesController extends GetxController {
  var isLoading = false.obs;

  ProfileRepositories _profileRepositories = ProfileRepositories();
  var username = "".obs;
  var avatar = "".obs;

  var followersCount = 0.obs;
  var followingCount = 0.obs;
  var likesCount = 0.obs;

  final ownerId = "".obs;
  // Future<void> getProfile(String userId) async {
  //   try {
  //     isLoading(true);

  //     final res = await _profileRepositories.getProfile(userId);
  //     print("Profile data in controller: ${res.toString()}");
  //     username.value = res.user?.name ?? "";
  //     avatar.value = res.user?.avatar ?? "";

  //     print("Videos list in profile controller: ${res.videos.toString()}");
  //     print("Runtimetype: ${res.videos.runtimeType}");

  //     print(
  //       "Username: ${username.value}, Avatar: ${avatar.value}, Followers: ${followersCount.value}, Following: ${followingCount.value}, Likes: ${likesCount.value}, Videos: ${videos[0].toString()}",
  //     );
  //     return;
  //   } catch (e) {
  //     print("Error fetching profile: ${e.toString()}");
  //     throw Exception("Failed to fetch profile");
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("ProfilesController initialized with get profile");
    // var args = Get.arguments;
    // print("UserId in ProfilesController onInit: ${args}");
    // getProfile(args?["ownerId"] as String);
  }
}
