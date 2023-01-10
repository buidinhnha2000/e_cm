
import 'package:dio/dio.dart';
import 'package:e_cm/data/network/services/urls.dart';
import '../../model/user/user.dart';
import '../../models/user/user.dart';

class UserServices {
  Future<User> register(String username, String password, String email) async {
    final resp = await Dio().post('${URLS.urlApi}/auth/register',
        data: Map.from({
          'username': username,
          'password': password,
          'email': email,
        })
    );

    return User.fromJson(resp.data);
  }
  Future<User> logout(String userId) async {
    final resp = await Dio().post('${URLS.urlApi}/auth/logout',
        data: Map.from({
          'userId': userId,
        })
    );
    return User.fromJson(resp.data);
  }

}

final userServices = UserServices();