
import 'package:dio/dio.dart';
import 'package:e_cm/data/network/services/urls.dart';
import '../../models/user/user.dart';

class UserServices {
  Future<User> register(String username, String password ) async {
    // print(username);
    final resp = await Dio().post('${URLS.urlApi}/auth/register',
        data: Map.from({
          'username': username,
          'password': password
        })
    );

    return User.fromJson(resp.data);
  }

}

final userServices = UserServices();