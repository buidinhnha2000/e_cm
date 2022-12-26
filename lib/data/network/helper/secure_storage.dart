
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

}

final secureStorage = SecureStorageService();