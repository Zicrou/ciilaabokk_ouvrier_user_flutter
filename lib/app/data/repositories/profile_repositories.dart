import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ciilaabokk_ouvrier_user/app/core/exceptions/network_exceptions.dart';
import 'package:ciilaabokk_ouvrier_user/app/core/values/endpoints.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/profile.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/user_info.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/models/user_register.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/providers/api_providers.dart';
import 'package:ciilaabokk_ouvrier_user/app/data/providers/auth_providers.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class ProfileRepositories {
  final dio = Dio();
  final _authProvider = Get.find<AuthProvider>();
  final _apiProvider = Get.find<ApiProvider>();
}
