import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {

  final secureStorage = const FlutterSecureStorage();
  Future<void> saveUserId(String userId) async {
    await secureStorage.write(key: "userId", value: userId);
  }

  Future<String?> getUserId() async => await secureStorage.read(key: "userId");

  Future<void> deleteSecureStorage() async {
    await secureStorage.delete(key: 'userId');
    await secureStorage.deleteAll();
  }

  Future<void> saveAddress(String country) async {
    await secureStorage.write(key: 'country', value: country);
  }

  Future<String?> getCountry() async => await secureStorage.read(key: 'country');

}

final secureStorage = SecureStorageService();