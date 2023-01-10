import 'package:dio/dio.dart';
import 'package:e_cm/data/model/address/address.dart';
import 'package:e_cm/data/network/services/urls.dart';

class AddressService {
  Future<Address?> updateAddress(String userId, String name, String email, int phone,
      String address, String country, String city) async {
    final resp = await Dio().post('${URLS.urlApi}/address',
        data: Map.from({
          'userId': userId,
          'name': name,
          'email': email,
          'phone': phone,
          'address': address,
          'country': country,
          'city': city,
        }));
    return Address.fromJson(resp.data);
  }
}

final addressService = AddressService();
