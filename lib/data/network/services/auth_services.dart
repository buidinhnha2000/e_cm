import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_cm/data/network/helper/secure_storage.dart';
import 'package:e_cm/data/network/services/urls.dart';
import '../../models/user/user.dart';

class AuthServices {
  Future<User?> login(String username, String password) async {
    try {
      final resp = await Dio().post('${URLS.urlApi}/auth/login',
          data: Map.from({'username': username, 'password': password}));
      return User.fromJson(resp.data);
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}

final authServices = AuthServices();
