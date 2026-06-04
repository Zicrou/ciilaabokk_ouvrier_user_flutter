import 'package:ciilaabokk_ouvrier_user/app/data/models/user.dart';

class Profile {
  User? user;

  Profile({this.user});

  // Profile.fromJson(Map<String, dynamic> json) {}
  Profile.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }
  @override
  String toString() {
    return '{user: $user}';
  }
}
