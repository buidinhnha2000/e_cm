import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:e_cm/data/network/services/urls.dart';
import '../../models/user/user.dart';

class AuthServices {
  Future<User> login(String username, String password) async {
    final resp = await Dio().post('${URLS.urlApi}/auth/login',
        data: Map.from({
          'username': username,
          'password': password})
    );
    return User.fromJson(jsonDecode(resp.data));
  }
}

final authServices = AuthServices();
