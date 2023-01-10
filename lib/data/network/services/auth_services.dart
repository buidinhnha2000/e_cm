
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_cm/data/network/services/urls.dart';
import '../../model/user/user.dart';

class AuthServices {
  Future<User?> login(String email, String password) async {
    try {
      final resp = await Dio().post('${URLS.urlApi}/auth/login',
          data: Map.from({'email': email, 'password': password}));
      final user = User.fromJson(resp.data);
      print(user);
      return User.fromJson(resp.data);
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}

final authServices = AuthServices();
